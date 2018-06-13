# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Mick Elliot <micke at sfu dot ca>

pkgname=exonerate
pkgver=2.4.0
pkgrel=1
pkgdesc='A general purpose tool for biological sequence comparison'
arch=('x86_64')
url='https://www.ebi.ac.uk/about/vertebrate-genomics/software/exonerate'
license=('GPL3')
depends=('glib2' 'pkgconfig')
source=("http://ftp.ebi.ac.uk/pub/software/vertebrategenomics/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('f849261dc7c97ef1f15f222e955b0d3daf994ec13c9db7766f1ac7e77baa4042')

build() {
  cd "${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
