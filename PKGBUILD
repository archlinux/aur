# Maintainer: Chun Yu <junyussh@gmail.com>
pkgname=quickapp-ide
pkgver=1.5.0
pkgrel=1
pkgdesc="quick app IDE for linux"
arch=("i386" "x86_64")
url="https://www.quickapp.cn/docCenter/IDEPublicity"
license=('custom')
groups=()
depends=(fontconfig libxtst gtk3 python cairo alsa-lib nss gcc-libs libnotify libxss 'glibc>=2.28-4' lsof which)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
  "https://statres.quickapp.cn/quickapp/ide/${pkgname}-${pkgver}.deb"
  "https://statres.quickapp.cn/quickapp/quickapp/201809/file/201809171830002525474.docx"
)
noextract=()
md5sums=('22a380224d2d50b7b2d0f206cc6850e2'
         '8d634c0f6d214e6cbacdae6b94f3ddae')

prepare() {
  ar -x ${pkgname}-${pkgver}.deb
  mkdir ${pkgname}-${pkgver}
	tar -xf data.tar.xz --directory="${pkgname}-${pkgver}"
}

package() {
  install -Dm 644 201809171830002525474.docx "$pkgdir/usr/share/licenses/$pkgname/LICENSE.docx"
  cd "$pkgname-$pkgver"
  # install -d opt/quickAppIDE
  # cp  opt/quickAppIDE ${pkgdir}
  # make DESTDIR="$pkgdir/" install
  cp -r ./ ${pkgdir}/
}
