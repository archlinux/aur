# Maintainer: Hao Long <aur@esd.cc>

pkgname=cloudflared-bin
pkgver=2019.5.0
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
source_x86_64=("https://bin.equinox.io/a/8BB9UWtfj2E/cloudflared-2019.5.0-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/4rSAipwhVs7/cloudflared-2019.5.0-linux-386.tar.gz")
source_armv6h=("https://bin.equinox.io/a/jZKYZCfPoRr/cloudflared-2019.5.0-linux-arm.tar.gz")
source_armv7h=("https://bin.equinox.io/a/jZKYZCfPoRr/cloudflared-2019.5.0-linux-arm.tar.gz")
sha256sums=('6a486a0f6c00e87cce1caf0aa8db45ea9fefd0bf91d9be6fc44460160dc0dbda'
            '4e06eb54143d872f73707ed2bba2ba2198649d3066df741bd0cfda5d1a5f334d'
            '407ff5e3f3fdfa3440bac2d4c8cb191493be37fa3bad388e7ab49ffd07c83f21'
            'bc40e3f7e1b21b93a949a1b1c05639584943d9ce9cc7ccb96612688eeb9fd206')
sha256sums_x86_64=('9e9f1a4fc7852bd4e78d318891b401e0c211affefb89d6945fbdbe2654d56ebf')
sha256sums_i686=('6ecaff7a633840c63e81fedcc8723243b5d19d92ae6307b9480bc83209221017')
sha256sums_armv6h=('c8935e50e6c7887fe574654bb9b24ad02da41aa47bda5f3b215faed135c8745f')
sha256sums_armv7h=('c8935e50e6c7887fe574654bb9b24ad02da41aa47bda5f3b215faed135c8745f')

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
