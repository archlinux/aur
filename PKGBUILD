# Maintainer: Utkarsh Singh <utkarsh190601 at gmail dot com>

pkgname='blender-docs'
pkgver=3.1
pkgrel=1
pkgdesc='Set of HTML documentation for blender'
arch=('any')
url='https://docs.blender.org/'
license=('custom:CC BY-SA 4.0')
options=('docs')
source=("$pkgname-$pkgver.zip::https://docs.blender.org/manual/en/latest/blender_manual_html.zip"
	LICENCE)

b2sums=('4d9b734b40a4245bcdc1b03aa1eab7c4e7accc46aca91541a7d35bdfd6cf4f86127694f069026fa9d1e4ddbc513f2288a6c2f2a97dea4e3663dde112118a4274'
       'd1e99ef6842a6b5e4ac63cc3ab5bd7a4fd0fec5a871eec5b8bc031d8a6b2ae89f76eca2f98b0946e78e19d5fa9b2dea51cb2bb0985d064f54ea4ed9759999205')

package() {
    mkdir -p "$pkgdir/usr/share/doc/blender/html/"
    cp -rf "$srcdir"/blender_manual*/* "$pkgdir"/usr/share/doc/blender/html
    find "$pkgdir"/usr/share/doc/blender/html/ -type f -exec chmod 0644 {} \;
    find "$pkgdir"/usr/share/doc/blender/html/ -type d -exec chmod 0755 {} \;
    install -Dm644 "$srcdir"/LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
