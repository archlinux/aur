# Maintainer: Rojikku <RojikkuNoKami at gmail dot com>
_pkgname=remoteplaywhatever
pkgname=${_pkgname}-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="Tiny application that lets you force remote play together any game you have in your steam library including non-steam ones."
arch=('x86_64')
url="https://github.com/m4dEngi/RemotePlayWhatever"
depends=('wxwidgets-common' 'wxwidgets-gtk3')
source=(
  ${pkgname}-${pkgver}.deb::https://github.com/m4dEngi/${_pkgname}/releases/download/${pkgver}-pre-alpha/${_pkgname}-${pkgver}-Linux.deb
)
sha512sums=('858e5bed802af11974513c37c895a9d372396104088b29063aff0a68b4acc2bb9b6370dc36dcd5f90a718c0ae471e34f749e3fa083dfe1b2fd255da0c24af249')

prepare() {
  cd "$srcdir"
  tar xvf data.tar.gz
}

package() {
  cd "$srcdir/usr/bin"

  # binary
  install -D -m0755 remoteplaywhatever "${pkgdir}/usr/bin/remoteplaywhatever"

}

