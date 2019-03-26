# Maintainer: Hao Long <aur@esd.cc>

pkgname=cloudflared-bin
pkgver=2019.3.2
pkgrel=3
pkgdesc="An Argo Tunnel client which proxies any local webserver through the Cloudflare network"
arch=("x86_64" "i686" "armv6h" "armv7h")
url="https://developers.cloudflare.com/argo-tunnel/"
license=("custom")
depends=("glibc")
provides=("cloudflared")
conflicts=("cloudflared")
source=("https://raw.githubusercontent.com/cloudflare/cloudflared/master/LICENSE"
        "cloudflared-bin.install"
        "cloudflared.yml"
        "cloudflared@.service"
        "cloudflared-dns.service")
source_x86_64=("https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-amd64.tgz")
source_i686=("https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-386.tgz")
source_armv6h=("https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-arm.tgz")
source_armv7h=("https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-arm.tgz")
sha256sums=('6a486a0f6c00e87cce1caf0aa8db45ea9fefd0bf91d9be6fc44460160dc0dbda'
            'adbe05f079d4d4fdf3ead36eead813c9bca8bed422be6d643aff14f91d47f15e'
            '4e06eb54143d872f73707ed2bba2ba2198649d3066df741bd0cfda5d1a5f334d'
            '407ff5e3f3fdfa3440bac2d4c8cb191493be37fa3bad388e7ab49ffd07c83f21'
            'bc40e3f7e1b21b93a949a1b1c05639584943d9ce9cc7ccb96612688eeb9fd206')
sha256sums_x86_64=('ea2ff0daea27107b4104a7efac85b86aa2364c4c53cdedc3c8dddfadc8de5fcf')
sha256sums_i686=('77f9467e61e13467e64f0d4e5e21c6128f73b1f95b21b3bd2b100ef4b6fd2335')
sha256sums_armv6h=('59e8e58120bf31b79e25f4a1d1e11192fddbb8f6c3e37134960d1683c807958a')
sha256sums_armv7h=('59e8e58120bf31b79e25f4a1d1e11192fddbb8f6c3e37134960d1683c807958a')

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
