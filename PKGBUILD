# Maintainer: nicknb <nicknb at posteo dot com>
_projectname=podman-tui
pkgname=$_projectname-bin
pkgver=1.11.2
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
sha256sums=('08e35acb25328dc366dfe687d5aa9845df06e90eba8b416f617c1f596fbc42b9'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4'
            '7a76a87f2d275ec40c67eef6fc17e816d8852b3c625551b9885bd1f6d6491741'
            'e58fffb942f83a19cd1fd93838caa3f27fcef3fae1a08b032a635a474e341c5e')

package() {
    install -Dm 644 "$_projectname-LICENSE" "$pkgdir/usr/share/licenses/$_projectname/LICENSE.md"
    install -Dm 644 "$_projectname-README" "$pkgdir/usr/share/doc/$_projectname/README.md"
    install -Dm 644 "$_projectname-install" "$pkgdir/usr/share/doc/$_projectname/install.md"
    cd "$_projectname-release-linux_amd64/${_projectname}-${pkgver}"
    install -Dm 755 "$_projectname" "$pkgdir/usr/bin/$_projectname"
}
