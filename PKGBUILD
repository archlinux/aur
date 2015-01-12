# Maintainer: James An <james@jamesan.ca>

pkgname=systemd-resolved-public-dns
pkgver=1
pkgrel=2
pkgdesc="Config files defining IPv4 public DNS for systemd's DNS resolver"
arch=('any')
url="https://github.com/jamesan/aur-pkgs/tree/master/$pkgname"
license=('GPL')
source=(
    comodo-secure-dns.conf
    dns-advantage.conf
    google-public-dns.conf
    norton-dns.conf
    opendns.conf
)
md5sums=(
    'f1b6009234ac60f118ee92d332efc00b'
    '92ae9aef034229d1ae1a7356760dc5b0'
    '915793b1f0dafa3d1c2c22ab224b353d'
    '1aafbfd2514aa39351d38c266085e320'
    '910578ec675036e85cf493a9bfd2afb0'
)

package() {
    for CONF in *.conf; do
        install -Dm644 "$CONF" "$pkgdir/usr/lib/systemd/resolved.conf.d/$CONF"
    done
}
