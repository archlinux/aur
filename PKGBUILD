# Maintainer: nicknb <nicknb at posteo dot com>
_projectname=podman-tui
pkgname=$_projectname-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="Podman Terminal UI"
arch=("x86_64")
url="https://github.com/containers/$_projectname"
license=("Apache-2.0")
provides=("$_projectname")
conflicts=("$_projectname")
source=("$_projectname-$pkgver.zip::$url/releases/download/v$pkgver/${_projectname}-release-linux_amd64.zip"
        "$_projectname-LICENSE::https://raw.githubusercontent.com/containers/podman-tui/refs/tags/v$pkgver/LICENSE"
        "$_projectname-README::https://raw.githubusercontent.com/containers/podman-tui/refs/tags/v$pkgver/docs/README.md"
        "$_projectname-install::https://raw.githubusercontent.com/containers/podman-tui/refs/tags/v$pkgver/docs/install.md")
sha256sums=('de1de10344a8ab636c64c2f982bdaa4e05696b642e2dd4692872f56b3254442f'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4'
            '627ee488a88c803ae8c425c96ba6aac24b915c65e0c46f352932171b05a76553'
            '1b531b307080b91ab12d6fef3c3caf7fc2d44bca820267336e9b078d2e8cbf3a')

package() {
    install -Dm 644 "$_projectname-LICENSE" "$pkgdir/usr/share/licenses/$_projectname/LICENSE.md"
    install -Dm 644 "$_projectname-README" "$pkgdir/usr/share/doc/$_projectname/README.md"
    install -Dm 644 "$_projectname-install" "$pkgdir/usr/share/doc/$_projectname/install.md"
    cd "${_projectname}-v${pkgver}"
    install -Dm 755 "$_projectname" "$pkgdir/usr/bin/$_projectname"
}
