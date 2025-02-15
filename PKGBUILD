# Maintainer: taotieren <admin@taotieren.com>

pkgbase=lckfb-meta
pkgname=(lckfb-meta lckfb-taishanpi-meta lckfb-logicalpi-fpga-g1-meta)
pkgver=0.0.7
pkgrel=1
epoch=
pkgdesc="立创开发板元包 / LCKFB Development Board meta package"
arch=(any)
url="https://lckfb.com/"
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
source=(
    lckfb-taishanpi-meta.install
    lckfb-logicalpi-fpga-g1-meta.install
)
sha256sums=('5173de61766b994e3f4dabb707aff92e54c44a6cd8c961b602519f14822c6cce'
            'cc7a568c7f2051ad7cfb35f79ae8a8d4700e37368807c3b37a8f39d1aa276c26')
# noextract=()
#validpgpkeys=()

package_lckfb-meta() {
    pkgdesc=${pkgdesc}
    depends=(l
        lckfb-taishanpi-meta
        lckfb-logicalpi-fpga-g1-meta
    )
}

package_lckfb-taishanpi-meta() {
    pkgdesc="立创开发板泰山派元包 RK3566-Linux 开发板 1G+0G 版本 / LCKFB Development Board TaishanPi meta package RK3566-Linux development board 1G+0G version"
    provides=("lckfb-taishanpi")
    conflicts=("lckfb-taishanpi")
    url="https://lckfb.com/project/detail/lctspi-1g-0g"
    install=$pkgname.install
    depends=(
        # pcb
        lceda-pro

        # repo
        repo
        git
        openssh
        openssl

        # build source
        bison
        chrpath
        coreutils
        cmake
        diffstat
        dtc
        expect
        fakeroot
        flex
        gawk
        gcc
        gcc-libs
        gdb
        lz4
        make
        qemu-user-static
        qemu-user-static-binfmt
        ncurses
        patchelf
        python
        python-pip
        python-pyelftools
        tar
        texinfo
        unzip

        # build u-boot & kernel for arm64
        aarch64-linux-gnu-gcc

        # rockchip official tools
        rkbin
        rkdeveloptool
        rkflashtool

        # Third-party rockchip tools
        xrock

        # Android debug
        android-file-transfer
        android-tools
        android-udev
        balena-etcher
        scrcpy
        windterm
    )
    optdepends=(
        # Network Sharing
        samba

        # buildroot
        buildroot-meta

        # ch34x driver
        ch34x-dkms
        ch343ser-dkms

        # Android debug
        escrcpy
    )
}

package_lckfb-logicalpi-fpga-g1-meta() {
    pkgdesc="立创开发板逻辑派 FPGA-G1 元包: 高云 GW2A-LV18、GD32F303 M4 / LCKFB Development Board LogicalPi FGPA-G1 meta package: Gowin GW2A-LV18 、GigaDevice GD32F303 M4"
    provides=("lckfb-logicalpi-fpga-g1")
    conflicts=("lckfb-logicalpi-fpga-g1")
    url="https://lckfb.com/project/detail/lckfb-ljpi-fpga-g1"
    install=$pkgname.install
    depends=(
        # pcb
        lceda-pro

        # repo
        git
        openssh
        openssl

        # build source
        cmake
        fakeroot
        gcc
        gcc-libs
        gdb
        make
        qemu-user-static
        qemu-user-static-binfmt
        qemu-system-riscv
        patchelf
        python
        python-pip
        python-pyelftools
        tar
        unzip

        # build  for riscv32
        riscv32-gnu-toolchain-glibc-bin
        riscv32-gnu-toolchain-elf-bin

        # Gowin official tools
        gowin-eda-ide
        gowin-eda-programmer

        # Modelsim  official tools
        modelsim-intel-starter

        # Third-party fpga tools
        jlink-software-and-documentation
        openfpgaloader
        tinyprog

        # GigaDevice official tools
        gd32-isp-console
    )
    optdepends=(
        # Network Sharing
        samba

        # Gowin edu toolchain
        gowin-eda-edu-ide
        gowin-eda-edu-programmer

        # Third-party fpga tools
        quartus-free-questa
    )
}
