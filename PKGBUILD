# Maintainer: Robert Rosca <32569096+RobertRosca@users.noreply.github.com>

pkgname=uv-bin
_pkgname=${pkgname%-bin}
conflicts=('uv')
pkgver=0.1.4
pkgrel=1
pkgdesc='An extremely fast Python package installer and resolver, written in Rust. Designed as a drop-in replacement for pip and pip-compile.'
arch=('aarch64' 'armv7l' 'i686' 'x86_64')
url='https://github.com/astral-sh/uv'
license=('MIT')
depends=('python')

source_aarch64=(https://github.com/astral-sh/uv/releases/download/$pkgver/uv-aarch64-unknown-linux-gnu.tar.gz)
source_armv7l=(https://github.com/astral-sh/uv/releases/download/$pkgver/uv-armv7-unknown-linux-gnueabihf.tar.gz)
source_i686=(https://github.com/astral-sh/uv/releases/download/$pkgver/uv-i686-unknown-linux-gnu.tar.gz)
source_x86_64=(https://github.com/astral-sh/uv/releases/download/$pkgver/uv-x86_64-unknown-linux-gnu.tar.gz)

sha256sums_aarch64=('d0341732b39688b2464cceecaf617af40898eb80b1093ced778e91d13837e057')
sha256sums_armv7l=('57fd95339e096d1f59641083bc58b42cd8e4b49ac355a40aed2613fbdaf5bafc')
sha256sums_i686=('a3d55664de30d58ba26d34106fea81f2532d73afb47d6812efa884d0726dae39')
sha256sums_x86_64=('1eb2f8ba39c231a310e41784980c8085eb747711ad59e430e75975a61a0a7fbf')

package() {
    cd "${_pkgname}-${CARCH}-unknown-linux-gnu"
    install -Dm755 uv "${pkgdir}/usr/bin/uv"
}
