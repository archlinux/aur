# Contributor: Richard Murri <admin@richardmurri.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
 
pkgname=emacs-icicles
epoch=1
pkgver=2018.10.15 # Taken from icicles.el
pkgrel=2
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
sha256sums=('4767672d03e3aea1e95aeb94df2103f42afb327440dd188cc863d7295eb1849c'
            '050a3b149bdffb465597a774d8da755aadcfd499d5e2a251128fee6e91f79018'
            'c108ddf5dced61c4e8d1ceb6f49d9494997d88f87fe3dd6d7ad9f97e4177e728'
            '9444c83d6d00690ad8155009217fe7cb774877833b58e9e0074f19583f7e7edf'
            '4797e605afcff18b0269951501278cc91f49431e84b8dce769238dd45b527c0b'
            '396d27a393ae2bb74518100b4b1dc5cd94b30f0b964b90d4a369f032d37bdd8e'
            '345a5834ac68933688810372d8187974fa0bb65c2c30cfb3aa3c813c1cfda49d'
            'e6def5b2613d6414ca208f2038d49a19e2523f57ca0af09e7fc217e7b345dbf5'
            'e7a866f1bf8898a83bbdf01e328964289683b1b4c2cb4896a7d5ea191a7b9594'
            '48fb48b5ed968b08f0a775e1e015425f51acf4bc32161d36511bfc8053122439'
            '3384917280c34759199f3ef6f9538a1380390b97624212f1bfc6c8b26b544859'
            '8f6211f6daeb80b1cee886b015d4bfc20c367da42654a6d6fe7c10e0f3d86200'
            '559f2e22bde92b5f1dc0d5595c0fd65db80fec92a8a58a414e13237b15a2dc12'
            '1511dd455ea7304d652a5c74f96c832bd4edbec8059fd1f72936976438a23457'
            'f87478240b50b2d92f413ef80bbac31dc9751713f6e91298f9c1440495ac3333'
            'e4b6b34bd18f9b1b7410092d9bcf219674474535f81ce3ffc8780fc891ea1a15'
            '7f915b700eb9b2bf46d6de1fdbd36d9f95d24f7c4d0b2f2082d2e27be4c64512'
            '9fc1e3b081ea1ede3afd399808cd3778676d70e18b1c90bbfe8b283722741bcd'
            '2ada538c479057f27487fbdf91d026365d6fc781b8cdc35bc9fe70c87398b926'
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
