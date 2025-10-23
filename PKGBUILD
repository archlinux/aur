# Maintainer: taotieren <admin@taotieren.com>

pkgbase=lckfb-meta
pkgname=(
    lckfb-meta
    lckfb-taishanpi-meta
    lckfb-logicalpi-fpga-{g,z}1-meta
    lckfb-dqx-ra6e2-meta
)
pkgver=0.0.9
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
    lckfb-logicalpi-fpga-{g,z}1-meta.install
    lckfb-dqx-ra6e2-meta.install
)
sha256sums=('e6a7e132f58898424825321fe64c91930ffb1696ea6136fbd457d1dddd932fbd'
            '481fc25f2e1648a11b7400046e44b6f0504370d1747191f1f6a71c13572e6014'
            '5912348da8d06b0bf6dbd1dd859b8430e167ce54c77f238507158f02d00a7c42'
            '4ed783d37008e652b99524908f0cf8e59f9943f6b9401e3a1dbb438d9fc7f424')
# noextract=()
#validpgpkeys=()

package_lckfb-meta() {
    pkgdesc=${pkgdesc}
    depends=(
        lckfb-taishanpi-meta
        lckfb-logicalpi-fpga-{g,z}1-meta
        lckfb-dqx-ra6e2-meta
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

        # baidunetdisk
        baidupcs
        baidunetdisk

        # netdisk tools
        openlist
        clouddrive
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

        # baidunetdisk
        baidupcs
        baidunetdisk

        # netdisk tools
        openlist
        clouddrive
    )
}

package_lckfb-logicalpi-fpga-z1-meta() {
    pkgdesc="立创开发板逻辑派 FPGA-Z1 元包: 紫光同创 PGC4KD / LCKFB Development Board LogicalPi FGPA-Z1 meta package: Pango PGC4KD"
    provides=("lckfb-logicalpi-fpga-z1")
    conflicts=("lckfb-logicalpi-fpga-z1")
    url="https://lckfb.com/project/detail/lckfb-ljpi-fpga-z1"
    install=$pkgname.install
    depends=(
        # pcb
        lceda-pro

        # repo
        git
        openssh
        openssl

        # Pango official tools
        pango-design-suite

        # Third-party fpga tools
        openfpgaloader
        tinyprog
    )
    optdepends=(
        # serial debug tools
        windterm
        serial-studio

        # baidunetdisk
        baidupcs
        baidunetdisk

        # netdisk tools
        openlist
        clouddrive
    )
}

package_lckfb-dqx-ra6e2-meta() {
    pkgdesc="立创开发板地奇星 RA6E2 元包: 瑞萨 RA6E2 ARM Cortex-M33 / LCKFB Development Board Earth Star RA6E2 meta package: Renesas RA6E2 ARM Cortex-M33"
    provides=("lckfb-dqx-ra6e2")
    conflicts=("lckfb-dqx-ra6e2")
    url="https://lckfb.com/project/detail/lckfb-dqx-ra6e2"
    install=$pkgname.install
    depends=(
        # pcb
        lceda-pro

        # repo
        git
        openssh
        openssl

        # Renesas official tools
        fsp-bin
        renesas-flash-programmer

        # Third-party fpga tools
        jlink-software-and-documentation

    )
    optdepends=(
        # baidunetdisk
        baidupcs
        baidunetdisk

        # netdisk tools
        openlist
        clouddrive
    )
}
