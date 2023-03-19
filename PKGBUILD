# Maintainer: YidaozhanYa <yidaozhan_ya@outlook.com>
pkgname=moondust-project-master-bin
pkgver=20220312
pkgrel=1
pkgdesc="Moondust Project (formerly known as PGE Project) is a free and open-source game engine and development kit for it, giving developers the ability to create platform games. (Binary package - master branch, built by CI)"
arch=('x86_64')
url="https://github.com/WohlSoft/Moondust-Project"
license=('GPLv3')
depends=('ffmpeg' 'sox' 'libtiff' 'desktop-file-utils' 'moondust-configpack')
#makedepends=('git')
#optdepends=()
provides=('moondust-project')
conflicts=('moondust-project-stable-bin' 'moondust-project-git')
install="moondust-project.install"
source=(
"http://builds.wohlsoft.ru/ubuntu-18-04/pge_project-linux-master-64.tar.bz2"
"moondust-engine.png::https://github.com/WohlSoft/Moondust-Project/raw/master/Engine/_resources/icon/cat_256.png"
"moondust-editor.png::https://github.com/WohlSoft/Moondust-Project/raw/master/Editor/_resources/images/cat_builder/cat_builder_256.png"
"moondust-calibrator.png::https://github.com/WohlSoft/Moondust-Project/raw/master/PlayableCalibrator/_resources/icon/calibrator_256.png"
"moondust-musplay.png::https://github.com/WohlSoft/Moondust-Project/raw/master/MusicPlayer/_resources/cat_musplay/cat_musplay_256x256.png"
"moondust-maintainer.png::https://github.com/WohlSoft/Moondust-Project/raw/master/Maintainer/_resources/icon/maintainer256.png"
"moondust-editor.desktop"
"moondust-engine.desktop"
"moondust-musplay.desktop"
"moondust-calibrator.desktop"
"moondust-maintainer.desktop"
)
sha512sums=(
"SKIP"
"c20deba3f580857a63d0ce2361188a0c137e9880334ddd2ddef779b1b0556019ea0ced113f5cf3658cf6174dd258c9e67df2cb79791c57509b8d563ace8eb92a"
"55d8cc501b8c759b6f4712268a2b07e01b7f49ae55d82cd916418d75b087d26fcfa9199cfbaa68bb8dbd7013f1e35ae9416ea7d2067eefd0a213f1e577d8000d"
"d208c4de44ac32cacb46736801e9c9437905791a17680ae2a3c52dd8f4fb16f48ad55b6d7dcfb603727db0bd97e0862802171d259dd9cadb62637aecfc956252"
"510af4bf95f1887b9940678916c88ad4e4e70a86932e8c30004619df1bce6c007b85be0d0421433defa95d5757ff717daec89d3004d65ccc2f70db828630d3fd"
"fd67c3e074fb2594d580e3420e7b12033e852650d5045672a99fcf1b5b68b286ad5a4d538de42e9e3939ef03caec14ac42216c9b908373c961ec23d1f2d421f7"
"1876fe0f0ddfc7ebfcd29c13dd3363ee2bafe77d133c38876e6c590a94114a1eae51eec9f2547aa2db3e6fc3acc0462faf4d8f1152c8abaab59ba850f963aeb5"
"c2b6ebf25baf2a657f203bb1208eeccbb889b469345f5f2f01949e7019834cf5af5b601a43fe4b171059cc7e0610be5f1b655e767d7c7face8cbcdb83bd364ca"
"97cbfe332e918d72845c11bb19c4a7150e05e2d7788cf0386a80d1e4da5eef6ea5ffa42f957a91823a82fe33c2092fcfd02a234387a8e8ebabeddc5b0d7ffdb0"
"6a390222644def5d58f4aac30afdc11b8e54b2da136d47fc69ed2e816fba063241a26449dbc474e93661c9d8af5b8b24b07f3f061e8a4e8f5b21e08a7b3cfaf7"
"9ee0eb2f735f16aea9412549d453949b17fcf68866e57b1ff578dd10a4a9e6ca26fdd19e868b11f79273c16050564a5bbc0a8e205448977f1c9fb08e6c101bc4"
)

pkgver() {
    date '+%Y%m%d'
}

package() {
    mkdir -p "${pkgdir}/opt/moondust"
    cp -r "${srcdir}/PGE_Project/"*"" "${pkgdir}/opt/moondust"
    chmod 0755 "${pkgdir}/opt/moondust/pge_editor"
    chmod 0755 "${pkgdir}/opt/moondust/pge_engine"
    chmod 0755 "${pkgdir}/opt/moondust/pge_musplay"
    chmod 0755 "${pkgdir}/opt/moondust/pge_calibrator"
    chmod 0755 "${pkgdir}/opt/moondust/GIFs2PNG"
    chmod 0755 "${pkgdir}/opt/moondust/PNG2GIFs"
    chmod 0755 "${pkgdir}/opt/moondust/LazyFixTool"
    chmod 0755 "${pkgdir}/opt/moondust/PaletteFilter"
    chmod 0755 "${pkgdir}/opt/moondust/pge_maintainer"

    mkdir -p "${pkgdir}/usr/bin"
    printf "#!/bin/bash\ncd /opt/moondust; /opt/moondust/pge_editor" > "${pkgdir}/usr/bin/pge_editor"
    printf "#!/bin/bash\ncd /opt/moondust; /opt/moondust/pge_engine" > "${pkgdir}/usr/bin/pge_engine"
    printf "#!/bin/bash\ncd /opt/moondust; /opt/moondust/pge_musplay" > "${pkgdir}/usr/bin/pge_musplay"
    printf "#!/bin/bash\ncd /opt/moondust; /opt/moondust/pge_calibrator" > "${pkgdir}/usr/bin/pge_calibrator"
    printf "#!/bin/bash\ncd /opt/moondust; /opt/moondust/GIFs2PNG" > "${pkgdir}/usr/bin/GIFs2PNG"
    printf "#!/bin/bash\ncd /opt/moondust; /opt/moondust/PNG2GIFs" > "${pkgdir}/usr/bin/PNG2GIFs"
    printf "#!/bin/bash\ncd /opt/moondust; /opt/moondust/LazyFixTool" > "${pkgdir}/usr/bin/LazyFixTool"
    printf "#!/bin/bash\ncd /opt/moondust; /opt/moondust/PaletteFilter" > "${pkgdir}/usr/bin/PaletteFilter"
    printf "#!/bin/bash\ncd /opt/moondust; /opt/moondust/pge_maintainer" > "${pkgdir}/usr/bin/pge_maintainer"
    chmod 0755 "${pkgdir}/usr/bin/pge_editor"
    chmod 0755 "${pkgdir}/usr/bin/pge_engine"
    chmod 0755 "${pkgdir}/usr/bin/pge_musplay"
    chmod 0755 "${pkgdir}/usr/bin/pge_calibrator"
    chmod 0755 "${pkgdir}/usr/bin/GIFs2PNG"
    chmod 0755 "${pkgdir}/usr/bin/PNG2GIFs"
    chmod 0755 "${pkgdir}/usr/bin/LazyFixTool"
    chmod 0755 "${pkgdir}/usr/bin/PaletteFilter"
    chmod 0755 "${pkgdir}/usr/bin/pge_maintainer"


    mkdir -p "${pkgdir}/usr/share/licenses"
    cp -r "${pkgdir}/opt/moondust/licenses" "${pkgdir}/usr/share/licenses/moondust"
    mv "${pkgdir}/opt/moondust/LICENSE.txt" "${pkgdir}/usr/share/licenses/moondust/LICENSE.txt"
    mv "${pkgdir}/opt/moondust/pge_engine.license.gpl3.txt" "${pkgdir}/usr/share/licenses/moondust/pge_engine.license.gpl3.txt"
    mv "${pkgdir}/opt/moondust/pge_engine.license.mit.txt" "${pkgdir}/usr/share/licenses/moondust/pge_engine.license.mit.txt"

    mkdir -p "${pkgdir}/usr/share/docs"
    cp -r "${pkgdir}/opt/moondust/help" "${pkgdir}/usr/share/docs/moondust"
    cp "${pkgdir}/opt/moondust/"*".txt" "${pkgdir}/usr/share/docs/moondust/"

    rm "${pkgdir}/opt/moondust/"*".ini"

    install -Dm0644 "${srcdir}/moondust-editor.png" "${pkgdir}/usr/share/pixmaps/moondust-editor.png"
    install -Dm0644 "${srcdir}/moondust-engine.png" "${pkgdir}/usr/share/pixmaps/moondust-engine.png"
    install -Dm0644 "${srcdir}/moondust-musplay.png" "${pkgdir}/usr/share/pixmaps/moondust-musplay.png"
    install -Dm0644 "${srcdir}/moondust-calibrator.png" "${pkgdir}/usr/share/pixmaps/moondust-calibrator.png"
    install -Dm0644 "${srcdir}/moondust-maintainer.png" "${pkgdir}/usr/share/pixmaps/moondust-maintainer.png"

    install -Dm0755 "${srcdir}/moondust-editor.desktop" "${pkgdir}/usr/share/applications/moondust-editor.desktop"
    install -Dm0755 "${srcdir}/moondust-engine.desktop" "${pkgdir}/usr/share/applications/moondust-engine.desktop"
    install -Dm0755 "${srcdir}/moondust-musplay.desktop" "${pkgdir}/usr/share/applications/moondust-musplay.desktop"
    install -Dm0755 "${srcdir}/moondust-calibrator.desktop" "${pkgdir}/usr/share/applications/moondust-calibrator.desktop"
    install -Dm0755 "${srcdir}/moondust-maintainer.desktop" "${pkgdir}/usr/share/applications/moondust-maintainer.desktop"
}
