# Maintainer: Hao Long <aur@esd.cc>

pkgname=cloudflared-bin
pkgver=2019.2.1
pkgrel=1
pkgdesc="An Argo Tunnel client which proxies any local webserver through the Cloudflare network"
arch=("x86_64" "i686" "armv6h" "armv7h")
url="https://developers.cloudflare.com/argo-tunnel/"
license=("custom")
depends=("glibc")
provides=("cloudflared")
conflicts=("cloudflared")
source=("https://raw.githubusercontent.com/cloudflare/cloudflared/master/LICENSE"
        "cloudflared.yml"
        "cloudflared@.service")
source_x86_64=("https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-amd64.tgz")
source_i686=("https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-386.tgz")
source_armv6h=("https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-arm.tgz")
source_armv7h=("https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-arm.tgz")
sha256sums=('6a486a0f6c00e87cce1caf0aa8db45ea9fefd0bf91d9be6fc44460160dc0dbda'
            '4e06eb54143d872f73707ed2bba2ba2198649d3066df741bd0cfda5d1a5f334d'
            'a2d6beef87b531ec43837ce1c2ebd7411058466a11bd6a899a8659582b25e3c2')
sha256sums_x86_64=('4a1fb91ecb040a0e4aee828a99b47a155c870109f9e47f3003cf486c0dc64bb4')
sha256sums_i686=('671ed8d5bcd455c64d2e36d4acc1cfc564c92ef1074e2d7e74dfb7b276021026')
sha256sums_armv6h=('d1612165886478ef3e4fc6d30c4e6b41195cba02e93dac20e5665a94dab369b2')
sha256sums_armv7h=('d1612165886478ef3e4fc6d30c4e6b41195cba02e93dac20e5665a94dab369b2')

package() {
    # Install License
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

    # Install Binary
    install -Dm755 cloudflared ${pkgdir}/usr/bin/cloudflared

    # Configuration File
    install -Dm644 cloudflared.yml ${pkgdir}/etc/cloudflared/cloudflared.yml.example
    install -Dm644 cloudflared@.service ${pkgdir}/usr/lib/systemd/system/cloudflared@.service
}

# vim: ts=2 sw=2 et:
