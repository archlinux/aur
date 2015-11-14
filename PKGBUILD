pkgname=bibfilex-qt
name=bibfilex-qt
pkgver=1.2.6.0
pkgrel=1
pkgdesc="A free bibliographic manager for GNU/Linux"
arch=('i686' 'x86_64')
url="https://sites.google.com/site/bibfilex/home"
license=('GPLv3')
depends=('qt5-base')

if [ ! -z "${DEVARCH}" ]; then
  CARCH=$DEVARCH
fi

if [ "${CARCH}" = 'x86_64' ]; then
    ARCH='amd64'
    md5sums=('98f1383a9ba707e0cc59da2f1873b8fb')
elif [ "${CARCH}" = 'i686' ]; then
    ARCH='i386'
    md5sums=('a4164181a78666fe47738ff7612293a8')
fi

source=("https://sites.google.com/site/bibfilex/download/${pkgname}_${pkgver}_${ARCH}.deb?attredirects=0&d=1")

build() {
  echo "Nothing to do."
}

package() {
  cd ${pkgdir}
  tar -xvf ${startdir}/src/data.tar.xz
  mv -v opt/bibfilex opt/${pkgname}
  mv -v usr/share/applications/Bibfilex.desktop usr/share/applications/${pkgname}.desktop
  mv -v usr/share/doc/bibfilex usr/share/doc/${pkgname}
}
