# Maintainer: Florent Jardin <florent.jardin@dalibo.com>
pkgname=pg-migrate-bin
_pkgname=pg-migrate
pkgver=1.1.0
pkgrel=1
_pkgtag="v1.1.0"
pkgdesc="Move your databases to PostgreSQL"
arch=('x86_64')
url="https://gitlab.com/dalibo/pg_migrate"
license=('PostgreSQL')
depends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!debug)

source=("${pkgname}-${pkgver}.tar.zst::https://gitlab.com/dalibo/pg_migrate/-/releases/${_pkgtag}/downloads/pg-migrate_linux_amd64.pkg.tar.zst"
        "LICENSE-${pkgver}::https://gitlab.com/dalibo/pg_migrate/-/raw/${_pkgtag}/LICENSE")

sha256sums=('5d3b099de09d6f7e2f09afeeefb57b18f2b8205c0108dd223ab98659bf3a3cb8'
            '26fedda6745ec0fabac275f0934bb47def7b60e7f728f1c6da359794f7d1330c')

package() {
    install -Dm755 "${srcdir}/usr/bin/pg_migrate" "${pkgdir}/usr/bin/pg_migrate"
    install -Dm644 "${srcdir}/usr/share/bash-completion/completions/pg_migrate" "${pkgdir}/usr/share/bash-completion/completions/pg_migrate"
    install -Dm644 "${srcdir}/usr/share/fish/vendor_completions.d/pg_migrate.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/pg_migrate.fish"
    install -Dm644 "${srcdir}/usr/share/zsh/vendor-completions/_pg_migrate" "${pkgdir}/usr/share/zsh/vendor-completions/_pg_migrate"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
