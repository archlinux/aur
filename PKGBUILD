# Maintainer: Paul Kasemir <paul.kasemir@gmail.com>
pkgname=find-the-command
pkgver=2.0.1
pkgrel=1
pkgdesc="Advanced command-not-found hook for bash, fish and zsh using the power of pacman"
arch=('any')
url="https://github.com/pkasemir/find-the-command"
license=('custom:WTFPL')
depends=('pacman>=5.0')
optdepends=('fzf: highly recommended for package selection and previews'
            'pacman-contrib: for weekly pacman-filesdb-refresh.timer'
            'pkgfile: provides faster searches than pacman'
            'sudo: helpful for privilege elevation')
install=find-the-command.install
options=('docs')
source=("https://github.com/pkasemir/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('aa312358f419a41ce48bc3c51f336892321fe3d8819b0e1a419c9eb2c8ba7593')

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 README.md usr/share/doc/"${pkgname}"/ftc.* -t \
    "$pkgdir/usr/share/doc/${pkgname}"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname}"
}
