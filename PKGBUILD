pkgname=bibfilex-gtk
name=bibfilex-gtk
pkgver=1.2.8.0
pkgrel=1
pkgdesc="A free bibliographic manager for GNU/Linux"
arch=('i686' 'x86_64')
url="https://sites.google.com/site/bibfilex/home"
license=('GPLv3')
depends=('gtk3')

if [ ! -z "${DEVARCH}" ]; then
  CARCH=$DEVARCH
fi

if [ "${CARCH}" = 'x86_64' ]; then
    ARCH='amd64'
md5sums=('b91685d13f4a0a445199af6aed119dc3')
elif [ "${CARCH}" = 'i686' ]; then
    ARCH='i386'
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
