# Maintainer: Fabian Franz BSc <aur@fabian-franz.eu>
pkgname=sshscan-git
pkgver=0.0.0
pkgrel=1
pkgdesc="SSHScan is a testing tool that enumerates SSH Ciphers. Using SSHScan, weak ciphers can be easily detected."
arch=('any')
url="https://github.com/evict/SSHScan/tree/master"
license=('MIT')
groups=()
depends=(python-pyaml)
source=(git+https://github.com/evict/SSHScan.git sshscan.sh)
md5sums=(SKIP SKIP) #generate with 'makepkg -g'

package() {
  mkdir -p $pkgdir/opt/SSHScan
  mkdir -p $pkgdir/usr/bin
  install -m 755 -o root -g root $srcdir/SSHScan/sshscan.py $pkgdir/opt/SSHScan/sshscan
  install -m 755 -o root -g root -T $srcdir/sshscan.sh $pkgdir/usr/bin/sshscan
  install -m 644 -o root -g root $srcdir/SSHScan/config.yml $pkgdir/opt/SSHScan/config.yml
}
