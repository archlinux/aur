# Maintainer: pencelheimer <pencelheimer@proton.me>
pkgname=postgres-language-server-bin
pkgver=0.25.0
pkgrel=1
pkgdesc="Language Server Protocol implementation for Postgres (packaged unofficially, developed by Supabase)"
arch=('x86_64')
url="https://github.com/supabase-community/postgres-language-server"
license=('MIT')
provides=('postgres-language-server')
conflicts=('postgres-language-server')

source=("LICENSE::https://raw.githubusercontent.com/supabase-community/postgres-language-server/refs/tags/${pkgver}/LICENSE")
source_x86_64=("postgres-language-server::https://github.com/supabase-community/postgres-language-server/releases/download/${pkgver}/postgres-language-server_x86_64-unknown-linux-gnu")

sha256sums=('fcd3687f0b40662b0abd423979f75484d54e0e4e2b8d0d74a6b2662efeeee375')
sha256sums_x86_64=('8e28040f4573dae48ae1d994d96686e8fb4d1519e8d9906d52fddf262d48e262')

package() {
    install -Dm755 "${srcdir}/postgres-language-server" "${pkgdir}/usr/bin/postgres-language-server"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
