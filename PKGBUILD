# Maintainer: 1sixth <i@shinta.ro>

pkgbase=anti-ad-smartdns-git
pkgname=(anti-ad-smartdns-git anti-ad-dnsmasq-git)
pkgver=0.936.d4edec4
pkgrel=1
pkgdesc="Configuration for adblocking via SmartDNS"
arch=('any')
url="https://github.com/privacy-protection-tools/anti-AD"
license=('MIT')
makedepends=('git')
source=("git+https://github.com/privacy-protection-tools/anti-AD.git")
md5sums=('SKIP')

pkgver(){
    cd anti-AD
    echo 0.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}
package_anti-ad-smartdns-git() {
    pkgdesc="Configuration for adblocking via SmartDNS"
    depends=('smartdns')
    install -Dm644 anti-AD/anti-ad-smartdns.conf "$pkgdir/etc/smartdns/anti-ad-smartdns.conf"
}

package_anti-ad-dnsmasq-git() {
    pkgdesc="Configuration for adblocking via Dnsmasq"
    depends=('dnsmasq')
    install -Dm644 anti-AD/adblock-for-dnsmasq.conf "$pkgdir/etc/dnsmasq.d/adblock-for-dnsmasq.conf"
}
