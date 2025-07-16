# Maintainer: Elmar Klausmeier <Elmar.Klausmeier@gmail.com>

pkgname=ssshguard
pkgver=1.1.0
pkgrel=1
pkgdesc="Brute force detector for SSH. Simplified version of SSHGuard. Blocks access via ipset."
arch=('x86_64')
url="https://eklausmeier.goip.de/blog/2024/08-25-replacing-sshguard-with-20-lines-of-perl-code"
license=('GPL')
optdepends=('iptables' 'perl' 'ipset')
source=("ssshguard" "ssshguard.service")
md5sums=('3776874b1eeaf717a1cf7b056b019272'
         'e6177b5a6ca5b70627062e77637af1a5')


package() {
	cd "$srcdir"
	install -Dm0755 "$srcdir/ssshguard" "$pkgdir/usr/bin/ssshguard"
	install -Dm0644 "$srcdir/ssshguard.service" "$pkgdir/usr/lib/systemd/system/ssshguard.service"
}

