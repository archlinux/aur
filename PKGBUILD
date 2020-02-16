# Maintainer: Andrej Radović (r.andrej@gmail.com)

pkgname=otf-inconsolata-lgc-markup
pkgver=1.00
pkgrel=1
depends=('fontconfig')
pkgdesc="Based on Inconsolata LGC. Slightly modified for markup languages "\
"such as LaTeX, Asciidoc, or markdown."
url="http://bdtechconcepts.com/Inconsolata-LGC-Markup-Font.html"
arch=('any')
license=('custom:OFL')
source=(https://fontlibrary.org/assets/downloads/inconsolata-lgc-markup/11723591be7ecb75419dd8e3b3fd7ece/inconsolata-lgc-markup.zip
	45-inconsolata-lgc-markup.conf
	90-non-tt-inconsolata-lgc-markup.conf)
sha1sums=('57cdab400c3b496d3bf8e015a68f87dbbb89133d'
          '732efcb262f05c792549bbddfb30f43312f9bd55'
          '1ba485be5297e78106f2c655215776fea6bafd49')

package() {
	install -m755 -d "${pkgdir}"/usr/share/fonts/"${pkgname}"
	install -m644 *.otf "${pkgdir}"/usr/share/fonts/"${pkgname}"

	install -m755 -d "${pkgdir}"/etc/fonts/conf.avail
	install -m755 -d "${pkgdir}"/etc/fonts/conf.d
	install -m644 45-inconsolata-lgc-markup.conf \
		"${pkgdir}"/etc/fonts/conf.avail/45-inconsolata-lgc-markup.conf
	install -m644 90-non-tt-inconsolata-lgc-markup.conf \
		"${pkgdir}"/etc/fonts/conf.avail/90-non-tt-inconsolata-lgc-markup.conf

	cd "${pkgdir}"/etc/fonts/conf.d
	ln -s ../conf.avail/45-inconsolata-lgc-markup.conf .
	ln -s ../conf.avail/90-non-tt-inconsolata-lgc-markup.conf .
}
