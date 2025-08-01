# Maintainer: PhantomShift <phantomsmhift at proton dot me>

_pkgname=lxcomm
pkgname=$_pkgname-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Mod browser, downloader and manager made for XCOM2(WOTC) on Linux"
url="https://github.com/PhantomShift/lxcomm"
license=('MIT OR Apache-2.0')
arch=('x86_64' 'aarch64')
provides=('lxcomm')
conflicts=('lxcomm')
depends=('steamcmd')
source=("lxcomm.desktop"
        "https://raw.githubusercontent.com/PhantomShift/lxcomm/refs/tags/v${pkgver}/LICENSE-MIT"
        "lxcomm.svg::https://raw.githubusercontent.com/PhantomShift/lxcomm/refs/tags/v${pkgver}/assets/lxcomm_icon.svg")
source_x86_64=("${url}/releases/download/v${pkgver}/lxcomm-v${pkgver}-Linux-GNU-x86_64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/lxcomm-v${pkgver}-Linux-GNU-aarch64.tar.gz")
sha256sums=('45f16be98e145170cf64df874baeddb4936e5beb95cf62ef9db75c515b43fa19'
            '53329bb76818eea16336345770e10cb8c088894d09885d2cd38c1837f9e63d70'
            '9448cfe1cee692c09177164b16ed32e54517be633130a79d8fae34b1fcd6d5c9')
sha256sums_x86_64=('15f04637ce0f00adb4e0fdf8ebfed510fa5abda918f685412ce0f3796aa1a1d5')
sha256sums_aarch64=('87b6c5e40b42395ee4d180caa0c966b8fa237bc3c4561d219447e42f87088fe7')

package() {
  install -Dm755 -t "$pkgdir/usr/bin/" $_pkgname
  install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkgname/" LICENSE-MIT
  install -Dm644 -t "$pkgdir/usr/share/applications/" $_pkgname.desktop
  install -Dm644 -t "$pkgdir/usr/share/pixmaps/" $_pkgname.svg
}
