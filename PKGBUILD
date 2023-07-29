# Contributor: Richard Murri <admin@richardmurri.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
 
pkgname=emacs-icicles
epoch=2
pkgver=2023.07.27.r23743 # Taken from icicles.el
pkgrel=1
pkgdesc="an emacs library that enhances minibuffer completion"
arch=('any')
url="https://www.emacswiki.org/emacs/Icicles"
depends=('emacs-bookmarkplus' 'emacs-hexrgb')
license=('GPL')
_base_url=https://www.emacswiki.org/emacs/download/
source=("${_base_url}icicles.el" \
	  "${_base_url}icicles-cmd1.el" \
	  "${_base_url}icicles-cmd2.el" \
	  "${_base_url}icicles-face.el" \
	  "${_base_url}icicles-fn.el" \
	  "${_base_url}icicles-mac.el" \
	  "${_base_url}icicles-mcmd.el" \
	  "${_base_url}icicles-mode.el" \
	  "${_base_url}icicles-opt.el" \
	  "${_base_url}icicles-var.el" \
	  "${_base_url}col-highlight.el" \
	  "${_base_url}crosshairs.el" \
	  "${_base_url}doremi.el" \
	  "${_base_url}ring+.el" \
	  "${_base_url}hl-line+.el" \
	  "${_base_url}icicles-chg.el" \
	  "${_base_url}icicles-doc1.el" \
	  "${_base_url}icicles-doc2.el" \
	  "${_base_url}icomplete+.el" \
	  "${_base_url}lacarte.el")
sha256sums=('e7c9cabedb22508003a38bb5722f1e1d887942cc71efc08d93b444f993f35204'
            'a9281348e370a43c978ef32f1ac29e6da1aef7c3cda0781c4b57dbcbe9115fd0'
            'fa5b6ff04b4ba722de6072222b8050fd8442a22017bf861a76d4c92f281bd015'
            '18ef316d318e243cd8d3d92dcf2375ffd0cb9f53cf3c28403e24c34b519d4e43'
            '5083e37993b539294e5ea6a3aa1ab674cb1640dafcb155814e34dcb94b5b86c2'
            '9c96fb2fbdb16f42cc6260075fe9bab386ad4bc40fc4b972b44b90a2164cdce2'
            'e84af61e8f1bb0c5c4606312b34b995d472e011af988f2040f1106b9e0c7326c'
            'c3a15a237d3bc859a003de7bf93dd839f087d2eb801a47f81d051d31ad9ec7fd'
            'ab12add14ef6762d3ba346c715256762be8e20b939194005d00d2dda2660b58e'
            'c32f0435e1e7a404cad354df1e159a368b6a4f938a8effcdf2fe72e98f9719cc'
            '3384917280c34759199f3ef6f9538a1380390b97624212f1bfc6c8b26b544859'
            '39e9281c5bcd130b4f219751caa4a52cff4b1dcddb0214b172d8efce3804a351'
            'ad39cf19e87e278ac53dd3a9f9fba383fafa347aab9cbb3a0f73869f1a7037e5'
            '1511dd455ea7304d652a5c74f96c832bd4edbec8059fd1f72936976438a23457'
            '02727ede8cdfb705f0d3dc675d51b1b7c6c407b15ab4d2a16de31516283140db'
            '0f309949266b7cf254132efb87db8d88c45b6a40ddb01696e88288a9a4128379'
            '1ca8c15210d5e218b463bfe0d629f974a4f7945ea50c8332570ec710191d0e3c'
            'ad1733dec78f1cbe17b36e556e2a957850b13f7e23ebd4e1d5e7a3ecddf70de9'
            'a883536feade2952a0c6fb4a1a677484799665918a78c4c2447c906b0a2fb959'
            '3694f37c5c5554882cf98b32b9322d8c243c9856aa735b1022ef30d3f0e954c3')

pkgver() {
  printf %s.r%s $(awk '/Version/ {print $3}' icicles.el) $(awk '/Update / {print $4}' icicles.el)
}

build() {
  emacs -Q -batch -L . -f batch-byte-compile *.el || true
}

package() {
  install -d  "$pkgdir"/usr/share/emacs/site-lisp/
  cp -r *{.el,.elc} "$pkgdir"/usr/share/emacs/site-lisp/
}
