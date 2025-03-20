# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs
_pkgname=amdguid-glow
pkgname="$_pkgname-bin"
_pkgver=1.0.12
pkgver=1.0.13
pkgrel=5
pkgdesc="AMDGPU temperature and fan speed monitoring tool"
url="https://github.com/Eraden/amdgpud"
license=('MIT' 'Apache-2.0')
source=("$_pkgname-$pkgver.zip::$url/releases/download/v$_pkgver/$_pkgname-archlinux-latest-$pkgver.zip")
arch=('x86_64')
md5sums=('75a62a7c5e083334a3b236c907ee600e')
depends=('amdfand')
optdepends=('amdmond' 'amdvold')
provides=("$_pkgname" 'amdguid')
conflicts=("$_pkgname" 'amdguid')

package() {
    cd "$srcdir"
    install -Dm0755 "target/release/$_pkgname" -t "$pkgdir/usr/bin"
    install -Dm0755 "target/release/amdgui-helper" -t "$pkgdir/usr/bin"
    install -Dm0644 "services/amdgui-helper.service" -t "$pkgdir/usr/lib/systemd/system"
}
