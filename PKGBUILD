# Maintainer: Félix "passcod" Saparelli <aur@passcod.name>
# Contributor: Matthieu "CircleCode" Codron <codronm+circlecode@gmail.com>
# Contributor: Niklas Heer <niklas.heer@gmail.com>
pkgname=hub-bin
pkgver=2.2.0
pkgrel=8
pkgdesc="hub helps you win at git. Go-powered version"
arch=('i686' 'x86_64')
url="https://hub.github.com"
license=('MIT')
_arch=amd64  # Workaround for mkaurball: https://bugs.archlinux.org/task/40711
[[ $CARCH = i686 ]] && _arch=386
source=("https://github.com/github/hub/releases/download/v${pkgver}/hub-linux-${_arch}-${pkgver}.tar.gz")
sha512sums=('b982c9345164b8c4afeb1b679cf129293cd441940bab8645699328b872d77ecc228cd4a1f6e95f2e71b553591636aab519c7c5ac43c7a8f771b1f80c05751465')
[[ $CARCH = i686 ]] && sha512sums=('dcba7563b5635f3d914e97fa8c3291983ae5ed70b6cd4232f9894d27d7387e12d4bad67ecb075fed6ede4af352a41c54983862d21640b1ccaff1340578bfcefd')
install='hub-bin.install'
package() {
  cd $srcdir/hub-linux-${_arch}-${pkgver}
  install -Dm755 {,$pkgdir/usr/bin/}hub
  install -Dm644 {etc/,$pkgdir/usr/share/git/completion/}hub.bash_completion.sh
  install -Dm644 etc/hub.zsh_completion "$pkgdir/usr/local/share/zsh/site-functions/_hub"
}
