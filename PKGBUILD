pkgname=bibfilex-qt
name=bibfilex-qt
pkgver=1.2.5.0
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
    md5sums=('61a5d047d4075eeb213d5033b767dac6')
elif [ "${CARCH}" = 'i686' ]; then
    ARCH='i386'
    md5sums=('0621bdb94bd60a3a54d24be85ccc96d7')
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
