# Maintainer: Hao Long <aur@esd.cc>

pkgname=cloudflared-bin
pkgver=2019.4.1
pkgrel=1
pkgdesc="An Argo Tunnel client which proxies any local webserver through the Cloudflare network"
arch=("x86_64" "i686" "armv6h" "armv7h")
url="https://developers.cloudflare.com/argo-tunnel/"
license=("custom")
depends=("glibc")
provides=("cloudflared")
conflicts=("cloudflared")
install="cloudflared-bin.install"
source=("https://raw.githubusercontent.com/cloudflare/cloudflared/master/LICENSE"
        "cloudflared.yml"
        "cloudflared@.service"
        "cloudflared-dns.service")
source_x86_64=("https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-amd64.tgz")
source_i686=("https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-386.tgz")
source_armv6h=("https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-arm.tgz")
source_armv7h=("https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-arm.tgz")
sha256sums=('6a486a0f6c00e87cce1caf0aa8db45ea9fefd0bf91d9be6fc44460160dc0dbda'
            '4e06eb54143d872f73707ed2bba2ba2198649d3066df741bd0cfda5d1a5f334d'
            '407ff5e3f3fdfa3440bac2d4c8cb191493be37fa3bad388e7ab49ffd07c83f21'
            'bc40e3f7e1b21b93a949a1b1c05639584943d9ce9cc7ccb96612688eeb9fd206')
sha256sums_x86_64=('6e762d64a839406bf94bd4815212f4d5e028143fa4e7eed3419453d2c6192cf6')
sha256sums_i686=('64a85a7971a4c232a3c8bc0c107005b4215aa309f124a05d4d41a1cd64d484ce')
sha256sums_armv6h=('823e23790864087ff640ce4d0966e23a5613d8cda30ebefdd663a35e14d374ba')
sha256sums_armv7h=('823e23790864087ff640ce4d0966e23a5613d8cda30ebefdd663a35e14d374ba')

package() {
    # Install License
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

    # Install Binary
    install -Dm755 cloudflared ${pkgdir}/usr/bin/cloudflared

    # Configuration File
    install -Dm644 cloudflared.yml ${pkgdir}/etc/cloudflared/cloudflared.yml.example
    install -Dm644 cloudflared@.service ${pkgdir}/usr/lib/systemd/system/cloudflared@.service
    install -Dm644 cloudflared-dns.service ${pkgdir}/usr/lib/systemd/system/cloudflared-dns.service
}

# vim: ts=2 sw=2 et:
