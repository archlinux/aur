# Contributor: Richard Murri <admin@richardmurri.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
 
pkgname=emacs-icicles
epoch=1
pkgver=2018.02.13 # Taken from icicles.el
pkgrel=2
pkgdesc="an emacs library that enhances minibuffer completion"
arch=('any')
url="http://www.emacswiki.org/emacs/Icicles"
depends=('emacs-bookmarkplus-mode' 'emacs-hexrgb')
license=('GPL')
makedepends=('wget')
_base_url=http://www.emacswiki.org/emacs/download/
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
            '550dee5940d021d6aac092291e3ee11707d56de3f45059d939d7d085d2e1979d'
            '2ba783fdad0d0d766de58827e899db734611a6dfeb7723dcc59a9fecceec5c97'
            '9444c83d6d00690ad8155009217fe7cb774877833b58e9e0074f19583f7e7edf'
            'e577fa4d5c996b9853619cefceb66c183010953f4e1dbd87d7786b99cb37c5ea'
            'b389d08affba03dfa326e63edb3b0c3ee1928b434b46fc5e05c7167ce9c7dbf3'
            '2a56a6806e15e1bdcbe1fb5cf99fa7d2406141535f64c44bc8699f31cc8fb615'
            'e6def5b2613d6414ca208f2038d49a19e2523f57ca0af09e7fc217e7b345dbf5'
            '3f86a7e70fd97327bfa05faa1105e93e5e3a0674c597a373bc6a529f52bac482'
            'd423b80f626530451378819fa9efadd5d36fafeb4a27ec3316cea2f70358afe4'
            '3384917280c34759199f3ef6f9538a1380390b97624212f1bfc6c8b26b544859'
            '8f6211f6daeb80b1cee886b015d4bfc20c367da42654a6d6fe7c10e0f3d86200'
            '559f2e22bde92b5f1dc0d5595c0fd65db80fec92a8a58a414e13237b15a2dc12'
            '1511dd455ea7304d652a5c74f96c832bd4edbec8059fd1f72936976438a23457'
            'f87478240b50b2d92f413ef80bbac31dc9751713f6e91298f9c1440495ac3333'
            'e73d1605531491b8b9115f479e52e15270f76acd9d47fca9673ebdf2748414cf'
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
