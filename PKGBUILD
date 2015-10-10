# Maintainer: Lev Levitsky <levlev@mail.ru>
pkgbase=('percolator-bin')
pkgname=('percolator' 'percolator-converters' 'elude')
pkgver=2.08.01
pkgrel=1
epoch=
pkgdesc="Software for postprocessing of shotgun proteomics data + format converters + Elude tool"
arch=('x86_64')
url="http://per-colator.com/"
license=('Apache')
depends=('gcc-libs')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}-git")
noextract=("${pkgname[0]}-${pkgver//./-}-amd64.deb"
		   "${pkgname[1]}-${pkgver//./-}-amd64.deb"
		   "${pkgname[2]}-${pkgver//./-}-amd64.deb")
source=("${noextract[0]}::http://sourceforge.net/projects/${pkgbase%-bin}/files/v${pkgver//./-}/${pkgname[0]}-v${pkgver//./-}-linux-amd64.deb/download"
"${noextract[1]}::http://sourceforge.net/projects/${pkgbase%-bin}/files/v${pkgver//./-}/${pkgname[1]}-v${pkgver//./-}-linux-amd64.deb/download"
"${noextract[2]}::http://sourceforge.net/projects/${pkgbase%-bin}/files/v${pkgver//./-}/${pkgname[2]}-v${pkgver//./-}-linux-amd64.deb/download")

md5sums=('734847fcc956adf81705400ce5dac48d'
		 '30a19985fbd2fb2962d836aa8c4e7a8c'
		 '116fa76bc81fddcfef63871516fdf4b1')

package_percolator() {
	pkgdesc="Percolator and qvality, two post processors for shotgun proteomics data."
	ar x "${srcdir}/${noextract[0]}"
	tar -xzf "${srcdir}/data.tar.gz" -C "$pkgdir"
}

package_percolator-converters() {
	pkgdesc="Parsers of different database search engines to percolator input format."
	ar x "${srcdir}/${noextract[1]}"
	tar -xzf "${srcdir}/data.tar.gz" -C "$pkgdir"
}

package_elude() {
	pkgdesc="Software package for prediction of retention times in mass spectorometry experiments."
	ar x "${srcdir}/${noextract[2]}"
	tar -xzf "${srcdir}/data.tar.gz" -C "$pkgdir"
}