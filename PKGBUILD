# Maintainer: YourName <your@email.com>
pkgname=asus-fa401km-acpi-fix
pkgver=1.0.0
pkgrel=1
pkgdesc="Fix slow boot (36s delay) for ASUS TUF Air 2025 (FA401KM) via DSDT override"
pkgdesc_cn="通过 DSDT 覆盖修复 ASUS TUF Air 2025 (FA401KM) 启动缓慢（36秒延迟）问题"
arch=('x86_64')
url="https://gist.github.com/HiFiPhile/324c330b204ef038ef8b3ff2aff7bb6c"
license=('unknown')
depends=('mkinitcpio')
install="${pkgname}.install"
source=(
    "dsdt.aml::https://gist.githubusercontent.com/HiFiPhile/324c330b204ef038ef8b3ff2aff7bb6c/raw/791afbad504a61e28738a6ad147f08471d1a583a/dsdt.aml"
)
sha256sums=('71794b35aa86d3a1accc54eb8cbf93f27454386ce53551d2c579daafa9519905')

package() {
    # 1. 安装 DSDT 文件到指定覆盖目录
    install -Dm644 "dsdt.aml" "${pkgdir}/etc/initcpio/acpi_override/dsdt.aml"

    msg2 "DSDT file installed."
}
