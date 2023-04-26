# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=terminal-headers
pkgver=1.3
pkgrel=1
pkgdesc='Color scripts providing a fun greeting when opening a terminal or reloading your shell'
install=terminal-headers.install
arch=(x86_64)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=(python-lolcat figlet bc)
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha512sums=(
  'a9cc74100be6d481e73adb06370f3d2cd807a1ea79bc5494d7b719fcacba2001bf90ab9d68e6e825b3dd17f00bd7e167428bc49fe592fc53641b73787e7ca69c'
  'ea9fb87094da0b7a7a146fca0cec4dbf0399e60bf1123988426406cadfa19b9cd6a6ba006f714f6fc89c72aec399c07060676ee8b453acc0945f20332d22a084'
  )
md5sums=(
  '2e433297a3e3357450d30a55ee005e6c'
  '0df3e6533bbafde65130c9fe5636abdd'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
  install -Dm755 opt/${pkgname}/* -t "${pkgdir}/opt/${pkgname}"
  install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 usr/share/terminal-headers/fonts/future.tlf "${pkgdir}/usr/share/terminal-headers/fonts/future.tlf"
}
