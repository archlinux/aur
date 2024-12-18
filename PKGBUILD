# Maintainer: Robert Zhou <meep.aur@meepzh.com>

pkgname=renderman-for-maya
pkgver=26.3.2351688
pkgrel=1
pkgdesc="RenderMan plugin for Maya"
arch=('x86_64')
url="https://renderman.pixar.com/"
license=('custom')
depends=('renderman-pro-server=26.3.2351688'
         'maya>=2024' 'maya<2025'
         'libffi6')
install="${pkgname}.install"

DLAGENTS+=("manual::/usr/bin/echo \ \ Note: Please download the RPM through the renderman package")
source=('manual://RenderManForMaya-26.3_2351688-linuxRHEL9_gcc11icx232.x86_64.rpm'
        'RenderMan_for_Maya_26.3.module')
b2sums=('54b5d2408c728c9e270672b3da8f731848f2447799f44769152fc42c1a9ffe5a8230e5f0b4a826c97a51da2dfcd6ef9afb278b69778b571cea17fd3eed56da8f'
        '14aa770b0ad698be3c2fd692277af46a5225c8bae3f7b28a32f6fc6e7a70fa2808eaaf58edb2e4f8cfada59e45f2fa77008347eddcb6f9f7348011ccef99eb25')

package() {
    mv opt "$pkgdir/"
    install -Dm644 "$srcdir/RenderMan_for_Maya_26.3.module" "$pkgdir/opt/pixar/RenderManForMaya-26.3/etc"
}
