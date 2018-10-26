# Maintainer: Mikael Blomstrand <mbloms ÅT kth DÖT se>
# Contributor: SharkEzz <icraft640@gmail.com>
# Contributor: Albert Vendrell <alvenca at gmail dot com>
# Contributor: Martin Minka <martin dot minka at gmail dot com>
# Contributor: Henk Westhuis <henk underscore westhuis at hotmail dot com>


pkgname=gitextensions
epoch=1
pkgver=2.51.05
pkgrel=1
pkgdesc="Graphical user interface for Git that allows you control Git without using the command line."
arch=('any')
url="http://gitextensions.github.io/"
license=('GPL3')
depends=('mono' 'git')
optdepends=('meld: compare and merge',
            'kdiff3: compare and merge')
source=('gitextensions'
        'gitextensions.desktop'
        'gitextensions.png'
        "https://github.com/gitextensions/gitextensions/releases/download/v${pkgver}/GitExtensions-${pkgver}-Mono.zip")
md5sums=('b01b1bf6d75b30f6763daa0498385e99'
         'cd36dafb8e961f67701117f622240e9b'
         'bbd6381241e896200c8494981115dff6'
         '1c40409a1b18c50022265ea6e24c220e')
sha256sums=('c0a5243de26e92f806f98f8dd611f93732a7c63941267a5f6530019a1f19a075'
            'dd2e7837bfeea6fdc447e21e5b90f3ba4d2441bf375dbb604ddd79375b9b4043'
            'bbfb8b3983cf12272bbc2c9ea593bcb3b7c57a1e7b4701070ef5fbcdc25d311f'
            '7c1a40af62bf78f5c969a33319828a567600b64e643db8021bc5e64717b19958')

package() {
  install -d "${pkgdir}/usr/share/"
  cp -r "${srcdir}/GitExtensions" "${pkgdir}/usr/share/"

  install -D -m755 "${srcdir}/gitextensions" "${pkgdir}/usr/bin/gitextensions"
  install -D -m644 "${srcdir}/gitextensions.png" "${pkgdir}/usr/share/pixmaps/gitextensions.png"
  install -D -m644 "${srcdir}/gitextensions.desktop" "${pkgdir}/usr/share/applications/gitextensions.desktop"
}
