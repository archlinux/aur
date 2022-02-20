# Contributor: Richard Murri <admin@richardmurri.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
 
pkgname=emacs-icicles
epoch=2
pkgver=2022.01.26.r23741 # Taken from icicles.el
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
	  "https://raw.githubusercontent.com/bnbeckwith/bnb-emacs-original/master/lacarte.el")
sha256sums=('3a7d914ccb5f38a9489c99f1aa39e9ba00bb697d41c2ee49160ee1123065933f'
            '1f62fd811e1a357bd4124010315b97d90c76ad46f370cb4b61736578106517e8'
            '217e9062479540c23a51d4fda5056878ba5606c37e936d63292d72de77c4a1dc'
            '18ef316d318e243cd8d3d92dcf2375ffd0cb9f53cf3c28403e24c34b519d4e43'
            '10c1b14f0b94065721224940cacc70fd628a51f65651be534b648a98141e6e4a'
            '9c96fb2fbdb16f42cc6260075fe9bab386ad4bc40fc4b972b44b90a2164cdce2'
            'a19593f470933efb42458ecac06fb5235f0eb932c07412d50177c0150092bd72'
            'c3a15a237d3bc859a003de7bf93dd839f087d2eb801a47f81d051d31ad9ec7fd'
            '308e57d1b4e87bd9e005f2f0e302ece4b8003bb427bce63d3e9aa2ff6c8c0607'
            '457ceaf8c3f0cfe19ddf88f5655b3b96be87eb5dd6fa95c10163865b00749456'
            '3384917280c34759199f3ef6f9538a1380390b97624212f1bfc6c8b26b544859'
            '39e9281c5bcd130b4f219751caa4a52cff4b1dcddb0214b172d8efce3804a351'
            '559f2e22bde92b5f1dc0d5595c0fd65db80fec92a8a58a414e13237b15a2dc12'
            '1511dd455ea7304d652a5c74f96c832bd4edbec8059fd1f72936976438a23457'
            '02727ede8cdfb705f0d3dc675d51b1b7c6c407b15ab4d2a16de31516283140db'
            '66c0e4ef03add9bf3277cb203829193d5a94a82b2a10ccc4a44e54b7ad0602bd'
            'bffa5418a35d4de137216f36b5c05b790075a6b12ca33e4ca2e89e10506f569f'
            'cbf469a83cf8a0ad7621c2ceb9179e978947b0695536ada90dcc199d3cd3d0ed'
            '2ada538c479057f27487fbdf91d026365d6fc781b8cdc35bc9fe70c87398b926'
            '711f49803e9f74e4ddda7de8e470b5f83de3a0ab7c57b6d250db186701e99989')

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
