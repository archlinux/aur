# Maintainer: Hao Long <aur@esd.cc>

pkgname=cloudflared-bin
pkgver=2019.6.0
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
source_x86_64=("https://bin.equinox.io/a/3RpFAEt45ov/cloudflared-2019.6.0-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/HWhnqWigiY/cloudflared-2019.6.0-linux-386.tar.gz")
source_armv6h=("https://bin.equinox.io/a/gEZP5gmXUU9/cloudflared-2019.6.0-linux-arm.tar.gz")
source_armv7h=("https://bin.equinox.io/a/gEZP5gmXUU9/cloudflared-2019.6.0-linux-arm.tar.gz")
sha256sums=('6a486a0f6c00e87cce1caf0aa8db45ea9fefd0bf91d9be6fc44460160dc0dbda'
            '4e06eb54143d872f73707ed2bba2ba2198649d3066df741bd0cfda5d1a5f334d'
            '791ec5bebea5863544f5e0db0d9184a5bbb75e66725f7505e83e252f51d84376'
            '7f6251ade23609189516375a1e8155e8457dd36e35ce24435e552dc6af0ad7a7')
sha256sums_x86_64=('524528ed564f1ac62ce25856b80efad5d56a37201af65a27d47ee9d5440a650c')
sha256sums_i686=('4ad5ec9b744754491b3bbfe71d5130f7a4fcd4bea5224387a5bd0ccf460cf236')
sha256sums_armv6h=('5b45543e1e2b1bde7259d042144bb06fffcea480e8cddf4a93e7bb7cb660a71b')
sha256sums_armv7h=('5b45543e1e2b1bde7259d042144bb06fffcea480e8cddf4a93e7bb7cb660a71b')

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
