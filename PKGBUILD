# Maintainer: Rojikku <RojikkuNoKami at gmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=ssh-vault
pkgver=1.0.11
pkgrel=1
pkgdesc="Encrypt/Decrypt using SSH keys"
arch=('x86_64')
url='https://ssh-vault.com'
license=('BSD')
depends=('glibc')
makedepends=('rust' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ssh-vault/ssh-vault/archive/${pkgver}.tar.gz")
sha256sums=('ef124bdec41ec9236cbc815f5f9199d2746f270d3f87da73304937d4b389163c')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release
}


package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 target/release/ssh-vault "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
