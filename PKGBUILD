# Maintainer: nicknb <nicknb at posteo dot com>
_projectname=podman-tui
pkgname=$_projectname-bin
pkgver=1.9.0
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
b2sums=('6a0fb15513aedd828a2cf558e5b3409ddc90a2efc646ebd3e099f909917f05b7f15adf1376756c31a44d41f002bacb881778bfeff41e1fa2ce662c5a128816fa'
        '43452dd4216bba835bff542c02fcd0a80b77fef97a6f1042adcbbbcf312bb856b0707c35b2f1af356e0b4262e501a159f06bf1f947f182d0023cdd4aefbd8a85'
        '770fc25e750924f5ee4b8c78e950a08a02e096baf126c0548577fe22893dbb36bbc01ed05bf0385d39ed16cb2f4053fa2095c9dfef6df8812cd481863c48fe69'
        'd6da32fe24e9cc77f48bce443193cb336742085e5520c43f9b9466b35c2329faf2a8df2c3e2aed142102e27ffd606b77d3df907a8912702f56e5dd3976fe765e')

package() {
    install -Dm 644 "$_projectname-LICENSE" "$pkgdir/usr/share/licenses/$_projectname/LICENSE.md"
    install -Dm 644 "$_projectname-README" "$pkgdir/usr/share/doc/$_projectname/README.md"
    install -Dm 644 "$_projectname-install" "$pkgdir/usr/share/doc/$_projectname/install.md"
    cd "$_projectname-release-linux_amd64/${_projectname}-${pkgver}"
    install -Dm 755 "$_projectname" "$pkgdir/usr/bin/$_projectname"
}
