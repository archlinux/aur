# Maintainer: Giancarlo Razzolini <grazzolini@gmail.com>
pkgname=mkinitcpio-tinyssh
pkgver=0.0.3
pkgrel=1
pkgdesc="Archlinux mkinitcpio hook to install and enable the tinyssh daemon in early userspace"
arch=('any')
url="https://github.com/grazzolini/mkinitcpio-tinyssh"
license=('BSD')
depends=('psmisc' 'tinyssh' 'ucspi-tcp')
optdepends=('mkinitcpio-netconf: Network interface configuration'
            'mkinitcpio-ppp: PPP interface configuration'
            'tinyssh-convert: For converting OpenSSH keys'
            'tinyssh-convert-git: For converting OpenSSH keys')
conflicts=('mkinitcpio-dropbear')
install=$pkgname.install
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v$pkgver.tar.gz")
changelog='ChangeLog'
sha512sums=('16f5f2c09bdcf53a7a63011630c6ce03c73db724a3bed52145e53a9d4dc818878af7ad48b7c19927bca9fd8fc9fc230dbcef966b14c40f48468109acd3618f64')

package() {
  install -Dm644 "$srcdir/$pkgname-$pkgver/tinyssh_hook"      "$pkgdir/usr/lib/initcpio/hooks/tinyssh"
  install -Dm644 "$srcdir/$pkgname-$pkgver/tinyssh_install"   "$pkgdir/usr/lib/initcpio/install/tinyssh"
}
