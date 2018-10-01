# Contributor: Richard Murri <admin@richardmurri.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
 
pkgname=emacs-icicles
epoch=1
pkgver=2018.02.13 # Taken from icicles.el
pkgrel=4
pkgdesc="an emacs library that enhances minibuffer completion"
arch=('any')
url="http://www.emacswiki.org/emacs/Icicles"
depends=('emacs-bookmarkplus' 'emacs-hexrgb')
license=('GPL')
makedepends=('wget')
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
	  "${_base_url}lacarte.el" \
	  "${_base_url}synonyms.el" \
	  "${_base_url}vline.el")
sha256sums=('52dd6fb0081c7405a59a3d9c9d9763538fb2d6f55b78750e1c2b6700f999aa73'
            '050a3b149bdffb465597a774d8da755aadcfd499d5e2a251128fee6e91f79018'
            '885de22e8700057d935203926f28a23b03b766fdb19494d810f4a1442a8fcef3'
            '9444c83d6d00690ad8155009217fe7cb774877833b58e9e0074f19583f7e7edf'
            '4797e605afcff18b0269951501278cc91f49431e84b8dce769238dd45b527c0b'
            '64d1bac59c226f6dfe93c48e16ba25f1112c427f5f53871ec1e777f3b9e60b5a'
            '2a56a6806e15e1bdcbe1fb5cf99fa7d2406141535f64c44bc8699f31cc8fb615'
            'e6def5b2613d6414ca208f2038d49a19e2523f57ca0af09e7fc217e7b345dbf5'
            'e7a866f1bf8898a83bbdf01e328964289683b1b4c2cb4896a7d5ea191a7b9594'
            'd423b80f626530451378819fa9efadd5d36fafeb4a27ec3316cea2f70358afe4'
            '3384917280c34759199f3ef6f9538a1380390b97624212f1bfc6c8b26b544859'
            '8f6211f6daeb80b1cee886b015d4bfc20c367da42654a6d6fe7c10e0f3d86200'
            '559f2e22bde92b5f1dc0d5595c0fd65db80fec92a8a58a414e13237b15a2dc12'
            '1511dd455ea7304d652a5c74f96c832bd4edbec8059fd1f72936976438a23457'
            'f87478240b50b2d92f413ef80bbac31dc9751713f6e91298f9c1440495ac3333'
            'e1ff98d3fa819f3e8c7d9c0f75e3a0e5dd1dc95601a3a31104ed7365abe08b8c'
            '7f915b700eb9b2bf46d6de1fdbd36d9f95d24f7c4d0b2f2082d2e27be4c64512'
            '9fc1e3b081ea1ede3afd399808cd3778676d70e18b1c90bbfe8b283722741bcd'
            '0a4687f40c66bb2a8d6e205660e7876a24971eb62e6be3878b7b2332a5741706'
            '5511070aa6dd7de9ed6c24ae03b9c6ed39bafbd267b0c2753bb26049cf9875e9'
            '02d36d32779ace53dcbed4fecbd5ac01e002450469ac70246eacd540f99772fe'
            'd2be35d52bbfddf10367e8bc2326630ae5f85e6720ec4714d715cde7904846fb')

pkgver() {
  echo $(awk '/Version/ {print $3}' icicles.el) 
}

build() {
  emacs -Q -batch -L . -f batch-byte-compile *.el || true
}

package() {
  install -d  "$pkgdir"/usr/share/emacs/site-lisp/
  cp -r "$srcdir"/*{.el,.elc} "$pkgdir"/usr/share/emacs/site-lisp/
}
