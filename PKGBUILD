# Maintainer: TheSilentDrifter a.k.a Larry Dewey <larry.j.dewey@gmail.com>

pkgname=tutanota-electron-git
pkgver=0.0.2
pkgrel=2
pkgdesc="A secure email client"
arch=('x86_64')
url="https://bitbucket.org/Thesilentdrifter/tutanota-electron"
licence=('BSD')
depends=('gulp-cli' 'npm')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=()
changeLog=()
source=("https://bitbucket.org/Thesilentdrifter/tutanota-electron/raw/838b4dfa85ffcda444f54fca8bc7c94363f0f0c4/tutanota-electron-git.tar.gz")
md5sums=('d248b739df5578c713637c80e3dd3a07')
sha512sums=('549774afb58995c002bb1e174a632712d0907cb14e82c2599e9451fb1e53f1f8f949ba16c7812f6549aa0d4079cb1691f701d65917fb100e5f5fe8d125d06abf')
build() {
  cd "$pkgname"
  ./build.sh
}

package() {
  mkdir -p "${pkgdir}/opt/$pkgname/"
  mkdir -p "${pkgdir}/usr/bin"
  cp -r "${srcdir}/${pkgname}/releases/tutanota-linux-x64/" "${pkgdir}/opt/$pkgname"
  install -Dm644 "$srcdir/$pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  ln -s /opt/tutanota-electron-git/tutanota-linux-x64/tutanota "${pkgdir}/usr/bin/tutanota"
  install -Dm755 "$srcdir/$pkgname/tutanota.desktop" "${pkgdir}/usr/share/applications/tutanota.desktop"
}
