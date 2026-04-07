# Maintainer: aisuneko icecat <iceneko@protonmail.ch>

pkgbase=fyn
pkgname=("$pkgbase")
#pkgname=("$pkgbase" "python-$pkgbase"{,-build})
pkgver=0.10.14
pkgrel=1
pkgdesc='extremely fast Python package installer and resolver (fork of uv)'
arch=('x86_64')
url="https://github.com/duriantaco/fyn"
license=('MIT' 'Apache-2.0')
depends=(
  'bzip2'
  'gcc-libs'
  'glibc'
)

options=(!lto)
conflicts=("fyn-git")
source=("$url/releases/download/$pkgver/fyn-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('115231610c04c03944e3fa1d34f1f472ef0380f32dd40b64f5a4d8c7a75e4b95')

package() {
  install -Dm755 "$srcdir/fyn-x86_64-unknown-linux-gnu/fyn" "$pkgdir/usr/bin/fyn"
  install -Dm755 "$srcdir/fyn-x86_64-unknown-linux-gnu/fynx" "$pkgdir/usr/bin/fynx"
}

# package_python-fyn() {
#   pkgdesc+=' - Python wrapper'
#   depends=(
#     python
#   )
# 
#   cd "$pkgbase"
#   _package_common
#   depends=(python "$pkgbase=$pkgver")
#   python -m installer -d "$pkgdir" target/wheels/fyn-$pkgver-*.whl
#   rm -rf "$pkgdir/usr/bin"
# }
# 
# package_python-fyn-build() {
#   pkgdesc+=' - Python build backend'
#   depends=(
#     bzip2
#     gcc-libs
#     glibc
#     python
#     xz
#   )
#   groups=(python-build-backend)
# 
#   cd "$pkgbase"
#   _package_common
#  python -m installer -d "$pkgdir" target/wheels/fyn_build-$pkgver-*.whl
# }
