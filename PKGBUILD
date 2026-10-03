# Maintainer: Matthias Braun <me@matthiasbraun.eu>
pkgname=show_sway_workspace_name-bin
pkgver=0.2.2
pkgrel=2
pkgdesc="Shows the current Sway workspace name as a large overlay on each monitor"
arch=(x86_64)
url="https://gitlab.com/bullbytes/show_sway_workspace_name"
license=(AGPL-3.0-or-later)
depends=()
provides=(show_sway_workspace_name)
conflicts=(show_sway_workspace_name)
# The binary is already stripped by CI (see the project's .gitlab-ci.yml),
# so there's nothing left for makepkg to strip and no debug info to split
# into a -debug package.
options=('!strip' '!debug')
# Every local source file name includes the version: makepkg reuses any
# source file that already exists under its local name (e.g. in an AUR
# helper's build cache), so an unversioned name would make an upgrade use
# the previous version's file, and fail its checksum.
source=(
    "show_sway_workspace_name-${pkgver}-x86_64::https://gitlab.com/api/v4/projects/84644846/packages/generic/show_sway_workspace_name/${pkgver}/show_sway_workspace_name-x86_64"
    "LICENSE-${pkgver}::https://gitlab.com/bullbytes/show_sway_workspace_name/-/raw/v${pkgver}/LICENSE"
    "show_sway_workspace_name-${pkgver}.1::https://gitlab.com/bullbytes/show_sway_workspace_name/-/raw/v${pkgver}/man/show_sway_workspace_name.1"
)
b2sums=('ec8ab49305c4e31b414c8da496b0930480a152402616f5aaf53c35ec56049824cdcd509e247dba3cc6a1cad33e7b23a103a987bda01495010fb24eee5a847c9c'
        'b6829320f725e3e45c4807ef5deb4738a691fb3ab146d8531b81fdbccd8376a826c8ec76165985cdf37d534f68e395652c96841ba7636c4bd34c49b7c7b3a9ec'
        'b319ef3eefc695b233e46137d34d54cf75e763d45eec8a2169fa87441597c9e8a5a71a3852d130dd379e560e0bd6330d472a61fe044a0c434914deaf41d13c8c')

package() {
    install -Dm755 "show_sway_workspace_name-${pkgver}-x86_64" "$pkgdir/usr/bin/show_sway_workspace_name"
    install -Dm644 "LICENSE-${pkgver}"                         "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "show_sway_workspace_name-${pkgver}.1"      "$pkgdir/usr/share/man/man1/show_sway_workspace_name.1"
}
