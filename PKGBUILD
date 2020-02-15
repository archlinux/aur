# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgbase=ttf-crimson-pro
pkgname=("$pkgbase" "$pkgbase-variable")
_pkgname=CrimsonPro
pkgver=1.002
_sha=04168bbd2884a098082451f6ffa677ca2c0bec4d
pkgrel=1
pkgdesc="A professionally produced redesign of Crimson by Jacques Le Bailly"
arch=('any')
url="https://github.com/Fonthausen/$_pkgname"
license=('OFL')
source=("https://github.com/Fonthausen/$_pkgname/archive/$_sha/$pkgname-$pkgver.zip")
sha256sums=('170284f7e42b72103b79dedc22eb188da68c1ccbaf418f39acfdfb310c1d3acc')

package_ttf-crimson-pro () {
    pkgdesc+=" (8 fixed weights)"
    conflicts+=('ttf-crimson-pro-git')
    cd "$_pkgname-$_sha"
    find ./fonts/ttfs -type f -iname "$_pkgname*.ttf" -execdir \
        install -Dm644 {} -t "$pkgdir/usr/share/fonts/TTF" \;
    install -Dm644 OFL.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_ttf-crimson-pro-variable () {
    pkgdesc+=" (variable weight)"
    cd "$_pkgname-$_sha"
    find ./fonts/variable -type f -iname "$_pkgname*.ttf" -execdir \
        install -Dm644 {} -t "$pkgdir/usr/share/fonts/TTF" \;
    install -Dm644 OFL.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
