# Maintainer: Andrea Denisse Gómez-Martínez <aur at denisse dot dev>

pkgname=oauth2-proxy-bin
_pkgname=${pkgname%-bin}
pkgdesc='A reverse proxy that provides authentication with Google, Github or other providers.'
arch=(aarch64 armv6h x86_64)
url='https://oauth2-proxy.github.io/oauth2-proxy/'
_url='https://github.com/oauth2-proxy/oauth2-proxy'
_branch='master'
pkgver=7.2.0
pkgrel=1
license=('MIT')
makedepends=(git go sed)
source=("$_pkgname::git+$_url.git#branch=$_branch")
source=("oauth2-proxy.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}.linux-amd64.tar.gz"
        "LICENSE::https://github.com/oauth2-proxy/oauth2-proxy/blob/v${pkgver}/LICENSE"
        "oauth2-proxy.service::https://github.com/oauth2-proxy/oauth2-proxy/blob/v${pkgver}/contrib/oauth2-proxy.cfg.example"
        "oauth2-proxy.cfg::https://github.com/oauth2-proxy/oauth2-proxy/blob/master/contrib/oauth2-proxy.cfg.example")
source_aarch64=("oauth2-proxy.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}.linux-arm64.tar.gz"
                "LICENSE::https://github.com/oauth2-proxy/oauth2-proxy/blob/v${pkgver}/LICENSE"
                "oauth2-proxy.service::https://github.com/oauth2-proxy/oauth2-proxy/blob/${pkgver}/contrib/oauth2-proxy.service.example"
                "oauth2-proxy.cfg::https://github.com/oauth2-proxy/oauth2-proxy/blob/v${pkgver}/contrib/oauth2-proxy.cfg.example")
source_armv6h=("oauth2-proxy.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}.linux-armv6.tar.gz"
               "LICENSE::https://raw.githubusercontent.com/oauth2-proxy/oauth2-proxy/v${pkgbuild}/LICENSE"
               "oauth2-proxy.service::https://raw.githubusercontent.com/oauth2-proxy/oauth2-proxy/v${pkgbuild}/contrib/oauth2-proxy.service.example"
               "oauth2-proxy.cfg::https://raw.githubusercontent.com/oauth2-proxy/oauth2-proxy/v${pkgbuild}/contrib/oauth2-proxy.cfg.example")
provides=($_pkgname)
conflicts=($_pkgname)

b2sums=('1eee625fde1fb301b01d708f58b819e5b64a4e4d62b5ebba9e9f83fdd027704d9120d793a74735970384e90628c26974b3e6d8b113b693a72fd8fe06cee8c71f'
        'fa5849073a77503437305af2be2affe8825ff09adbceeb5283f80c1dcfa4b4e5184c4ab2be04bdcdfd024608c81c5e78925054a0ddde5acf8c7e021149741b29'
        'a21931d41c1693999c0dc815024050f976e7f9be1420c73ea811687650076ad3d173aaaeb5d565c2fab22daa67699c7b02c88198a5fb3a5a9573d2c65187096f'
        '27917f1fc826e039da7dc7fa1abb88bb3ebe7933316562e5525722a05352268a4714daa67328e842dbaa7f489d2889781d0144f0aaf380ed5d0b040b7a9f06be')
b2sums_aarch64=('1eee625fde1fb301b01d708f58b819e5b64a4e4d62b5ebba9e9f83fdd027704d9120d793a74735970384e90628c26974b3e6d8b113b693a72fd8fe06cee8c71f'
                'fa5849073a77503437305af2be2affe8825ff09adbceeb5283f80c1dcfa4b4e5184c4ab2be04bdcdfd024608c81c5e78925054a0ddde5acf8c7e021149741b29'
                'a21931d41c1693999c0dc815024050f976e7f9be1420c73ea811687650076ad3d173aaaeb5d565c2fab22daa67699c7b02c88198a5fb3a5a9573d2c65187096f'
                '27917f1fc826e039da7dc7fa1abb88bb3ebe7933316562e5525722a05352268a4714daa67328e842dbaa7f489d2889781d0144f0aaf380ed5d0b040b7a9f06be')
b2sums_armv6h=('1eee625fde1fb301b01d708f58b819e5b64a4e4d62b5ebba9e9f83fdd027704d9120d793a74735970384e90628c26974b3e6d8b113b693a72fd8fe06cee8c71f'
               'fa5849073a77503437305af2be2affe8825ff09adbceeb5283f80c1dcfa4b4e5184c4ab2be04bdcdfd024608c81c5e78925054a0ddde5acf8c7e021149741b29'
               'a21931d41c1693999c0dc815024050f976e7f9be1420c73ea811687650076ad3d173aaaeb5d565c2fab22daa67699c7b02c88198a5fb3a5a9573d2c65187096f'
               '27917f1fc826e039da7dc7fa1abb88bb3ebe7933316562e5525722a05352268a4714daa67328e842dbaa7f489d2889781d0144f0aaf380ed5d0b040b7a9f06be')

package() {
  install -Dm755 "$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 oauth2-proxy.cfg "$pkgdir/etc/oauth2-proxy.cfg"
  install -Dm644 oauth2-proxy.service "$pkgdir/usr/lib/systemd/system/oauth2-proxy.service"
}
