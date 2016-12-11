# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase=tsmuxer-ng-bin
pkgname=('tsmuxer-cli-ng-bin'
         'tsmuxer-gui-ng-bin'
         )
pkgver=2.6.11
pkgrel=1
pkgdesc="Transport Stream muxer. New Generation (3D capable)"
arch=('i686' 'x86_64')
url='http://forum.doom9.org/showthread.php?t=168539'
license=('custom')
source=("tsmuxer-${pkgver}.tar.gz::https://docs.google.com/uc?authuser=0&id=0B0VmPcEZTp8NekJxLUVJRWMwejQ&export=download"
        'tsmuxergui.desktop'
        'tsmuxergui.png'
        )
sha256sums=('815a383aebc67e59b6e541b927ce14480efed9d103fe99e74ced9ea381f61764'
            'aed84b10da52849c14acb6bfb8b806c9675e4c8bcf781590712bbedc332b443f'
            '5d1a6b9e88a82d40a0159d95bb596a7dc4502d7164364098e4cc3ddef72632c0'
            )
options=('!strip')

package_tsmuxer-cli-ng() {
  pkgdesc="Transport Stream muxer. New Generation (3D capable). CLI"
  depends_i686=('gcc-libs'
                'freetype2'
                )
  depends_x86_64=('lib32-gcc-libs'
                  'lib32-freetype2'
                  )
  provides=('tsmuxer-cli'
            'tsmuxer-cli-bin'
            )
  conflicts=('tsmuxer'
             'tsmuxer-cli'
             )

  install -Dm755 tsMuxeR "${pkgdir}/usr/bin/tsmuxer"
  (cd ${pkgdir}/usr/bin; upx -d -q tsmuxer &>/dev/null)
}

package_tsmuxer-gui-ng() {
  pkgdesc="Transport Stream muxer. New Generation (3D capable). GUI"
  depends_i686=('gcc-libs'
                'qt4'
                )
  depends_x86_64=('lib32-gcc-libs'
                  'lib32-qt4'
                  )
  provides=('tsmuxer-gui-bin' 
            'tsmuxer-gui'
            )
  conflicts=('tsmuxer' 
             'tsmuxer-gui'
             )

  install -Dm755 tsMuxerGUI "${pkgdir}/usr/bin/tsmuxergui"
  (cd ${pkgdir}/usr/bin; upx -d -q tsmuxergui &>/dev/null)

  install -Dm644 tsmuxergui.desktop "${pkgdir}/usr/share/applications/tsmuxergui.desktop"
  install -Dm644 tsmuxergui.png "${pkgdir}/usr/share/pixmaps/tsMuxergui.png"
}
