# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Mick Elliot <micke at sfu dot ca>

pkgname=exonerate
pkgver=2.4.0
pkgrel=2
pkgdesc='A general purpose tool for biological sequence comparison'
arch=('x86_64')
url='https://www.ebi.ac.uk/about/vertebrate-genomics/software/exonerate'
license=('GPL-3.0-only')
depends=('glib2')
source=("http://ftp.ebi.ac.uk/pub/software/vertebrategenomics/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('f849261dc7c97ef1f15f222e955b0d3daf994ec13c9db7766f1ac7e77baa4042')

build() {
  cd "${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make -j1
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
