# Maintainer: Auteiy <dmitry@auteiy.me>

pkgname=katfetch-git
pkgver=1.2.9
pkgrel=2
pkgdesc="A minimal and customizable fetch script."
arch=(any)
url="https://gitlab.com/KatHamer/katfetch"
license=(MIT)
depends=(python-click python-psutil python-hurry-filesize python-py-cpuinfo python-distro) 

_commit="1e079b39520664f27c85c289eb5e56b40dbd229b"
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/KatHamer/katfetch/-/archive/$_commit/katfetch-$_commit.tar.gz")

sha256sums=('94ef602e0d5d5f8e2e9453d9205f51fcdbd916f8042ac80c0acd3778aaaf0666')

package() {
cd katfetch-$_commit
python3 setup.py install --root="$pkgdir/"
install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
