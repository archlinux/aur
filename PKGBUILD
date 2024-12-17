# Maintainer: taotieren <admin@taotieren.com>

pkgbase=rt-thread-meta
pkgname=(rt-thread-meta rt-thread-env-meta)
pkgver=0.0.3
pkgrel=1
epoch=
pkgdesc="RT-Thread 开发元包 / RT-Thread Development meta package"
arch=(any)
url="https://github.com/RT-Thread"
license=('Apache-2.0')
# groups=()
# depends=()
# makedepends=()
# checkdepends=()
# optdepends=()
# provides=()
# conflicts=()
# replaces=()
# backup=()
options=()
# install=
# changelog=
source=(rt-thread-env-meta.install)
sha256sums=('118ce4a09379943e2ea9f3c8b179d46439e887382d6dbd7bd86c5736ef7c7086')
# noextract=()
#validpgpkeys=()

package_rt-thread-meta() {
    pkgdesc=${pkgdesc}
    depends=(
        rt-thread-devel
        rt-thread-env-meta
    )
}

package_rt-thread-env-meta() {
    pkgdesc="RT-Thread/ENV 开发元包 / RT-Thread/ENV Development meta package"
    provides=("rt-thread-env")
    conflicts=("rt-thread-env")
    install=$pkgname.install
    depends=(
        # repo
        git

        # build source
        cmake
        ninja
        make
        gcc
        gcc-libs
        gdb
        ncurses
        scons
        python
        python-requests
        python-kconfiglib
        python-pip
        python-tqdm

        # build for arm
        arm-none-eabi-gcc
        arm-none-eabi-gdb
        qemu-desktop
        qemu-system-arm-firmware

        # AUR or https://github.com/taotieren/aur-repo
        python-pyocd
    )
    optdepends=(
        'python-pyocd-pemicro: Python On Chip Debugger and programmer for ARM Cortex-M microcontrollers using CMSIS-DAP'
        'code: The Open Source build of Visual Studio Code (vscode) editor'
        'visual-studio-code: Visual Studio Code (vscode): Editor for buildingand debugging modern web and cloud applications (official binary version)'
        'embedded-studio: Segger Embedded Studio'
        'codelite: Cross platform IDE for C, C++, Rust, Python, PHPand Node.js written in C++'
        'eclipse-platform: A minimal installation suitable for complete per-user customization with the built-in Eclipse package manager'
    )
}
