# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=openicc-basiccolor-offset-profiles
pkgver=2009.1.1.1
pkgrel=1
pkgdesc='Extra ICC profiles'
url='https://www.freedesktop.org/wiki/OpenIcc/ProfilePackages'
arch=('any')
source=("https://master.dl.sourceforge.net/project/openicc/basICColor-Profiles/basICColor_Offset_${pkgver/./-}.tar.gz")
license=('GPL')
sha256sums=('2f32a4694fc34a7845523b175c2b63415265bdf39842abe34fd70941e759c3b4')

build() {
  cd basICColor_Offset_${pkgver/./-}
  ./configure \
    --prefix=/usr

  make
}

package() {
  cd basICColor_Offset_${pkgver/./-}
  make DESTDIR="${pkgdir}" install
  find . -name '*.pdf' -type f -exec install -Dm644 {} "${pkgdir}/usr/share/doc/${pkgname}/"{} \;
}

