pkgname=bibfilex-gtk
name=bibfilex-gtk
pkgver=1.2.5.0
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
    md5sums=('4cfe3e47acffc30ba4c1a26ae623506e')
elif [ "${CARCH}" = 'i686' ]; then
    ARCH='i386'
    md5sums=('d0b417b47f6e30570aa61a6e7f59b5ba')
fi

source=("https://sites.google.com/site/bibfilex/download/${pkgname}_${pkgver}_${ARCH}.deb?attredirects=0&d=1")

build() {
  echo "Nothing to do."
}

package() {
  cd ${pkgdir}
  tar -xvf ${startdir}/src/data.tar.gz
  mv -v opt/bibfilex opt/${pkgname}
  mv -v usr/share/applications/Bibfilex.desktop usr/share/applications/${pkgname}.desktop
  mv -v usr/share/doc/bibfilex usr/share/doc/${pkgname}
}
