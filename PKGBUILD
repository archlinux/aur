##
# Maintainer: pyamsoft <pyam(dot)soft(at)gmail(dot)com>
##

pkgname=pstate-frequency
pkgdesc="Easily control Intel p-state driver"
pkgver=2.0.1
pkgrel=1
arch=('i686' 'x86_64')
makedepends=('git')
depends=('coreutils' 'grep')
optdepends=('x86_energy_perf_policy: For the x86_energy_perf_policy-sleep.service')
provides=('pstate-frequency')
conflicts=('pstate-frequency')
license=('GPLv2')
url="https://github.com/pyamsoft/pstate-frequency/archive/${pkgver}.tar.gz"
source=("${url}")
sha256sums=('5f6f3df45c7f036402e11381a094209031fe6e627647dca9a1db4c2458f6e74c')

###############################################################################

##
# Please read config.mk for an explanation
# of the variable options in this file
##

##
# DEFAULTS
# _CC="clang"
# _PREFIX="/usr/local"
# _INCLUDE_BASH_COMPLETION=1
# _INCLUDE_ZSH_COMPLETION=0
# _INCLUDE_DOC=1
# _INCLUDE_SRC=1
# _INCLUDE_LICENSE=1
# _INCLUDE_UDEV_RULE=1
# _INCLUDE_SYSTEMD_UNIT=1
# _X86_ENERGY_PERF_POLICY=1
# _PRESET_POWER_PLAN_MAX_PERFORMANCE="100 100 0 performance"
# _PRESET_POWER_PLAN_PERFORMANCE="100 0 1 powersave"
# _PRESET_POWER_PLAN_POWERSAVE="0 0 1 powersave"
# _AUTO_POWER_PLAN_AC="performance"
# _AUTO_POWER_PLAN_BAT="powersave"
##

_CC="clang"
_PREFIX="/usr"
_INCLUDE_BASH_COMPLETION=1
_INCLUDE_ZSH_COMPLETION=0
_INCLUDE_UDEV_RULE=1
_INCLUDE_SYSTEMD_UNIT=1
_INCLUDE_DOC=1
_INCLUDE_SRC=1
_INCLUDE_LICENSE=1
_X86_ENERGY_PERF_POLICY=1
_PRESET_POWER_PLAN_MAX_PERFORMANCE="100 100 0 performance"
_PRESET_POWER_PLAN_PERFORMANCE="100 0 1 powersave"
_PRESET_POWER_PLAN_POWERSAVE="0 0 1 powersave"
_AUTO_POWER_PLAN_AC="performance"
_AUTO_POWER_PLAN_BAT="powersave"

prepare() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make \
    DESTDIR="$pkgdir" \
    CC="${_CC}" \
    PREFIX="${_PREFIX}" \
    X86_ENERGY_PERF_POLICY=${_X86_ENERGY_PERF_POLICY} \
    INCLUDE_BASH_COMPLETION=${_INCLUDE_BASH_COMPLETION} \
    INCLUDE_ZSH_COMPLETION=${_INCLUDE_ZSH_COMPLETION} \
    INCLUDE_UDEV_RULE=${_INCLUDE_UDEV_RULE} \
    INCLUDE_SYSTEMD_UNIT=${_INCLUDE_SYSTEMD_UNIT} \
    INCLUDE_DOC=${_INCLUDE_DOC} \
    INCLUDE_LICENSE=${_INCLUDE_LICENSE} \
    INCLUDE_SRC=${_INCLUDE_SRC} \
    PRESET_POWER_PLAN_MAX_PERFORMANCE="\"${_PRESET_POWER_PLAN_MAX_PERFORMANCE}\"" \
    PRESET_POWER_PLAN_PERFORMANCE="\"${_PRESET_POWER_PLAN_PERFORMANCE}\"" \
    PRESET_POWER_PLAN_POWERSAVE="\"${_PRESET_POWER_PLAN_POWERSAVE}\"" \
    AUTO_POWER_PLAN_AC="\"${_AUTO_POWER_PLAN_AC}\"" \
    AUTO_POWER_PLAN_BAT="\"${_AUTO_POWER_PLAN_BAT}\"" \
    options
}

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make \
    DESTDIR="$pkgdir" \
    CC="${_CC}" \
    PREFIX="${_PREFIX}" \
    X86_ENERGY_PERF_POLICY=${_X86_ENERGY_PERF_POLICY} \
    INCLUDE_BASH_COMPLETION=${_INCLUDE_BASH_COMPLETION} \
    INCLUDE_ZSH_COMPLETION=${_INCLUDE_ZSH_COMPLETION} \
    INCLUDE_UDEV_RULE=${_INCLUDE_UDEV_RULE} \
    INCLUDE_SYSTEMD_UNIT=${_INCLUDE_SYSTEMD_UNIT} \
    INCLUDE_DOC=${_INCLUDE_DOC} \
    INCLUDE_LICENSE=${_INCLUDE_LICENSE} \
    INCLUDE_SRC=${_INCLUDE_SRC} \
    PRESET_POWER_PLAN_MAX_PERFORMANCE="\"${_PRESET_POWER_PLAN_MAX_PERFORMANCE}\"" \
    PRESET_POWER_PLAN_PERFORMANCE="\"${_PRESET_POWER_PLAN_PERFORMANCE}\"" \
    PRESET_POWER_PLAN_POWERSAVE="\"${_PRESET_POWER_PLAN_POWERSAVE}\"" \
    AUTO_POWER_PLAN_AC="\"${_AUTO_POWER_PLAN_AC}\"" \
    AUTO_POWER_PLAN_BAT="\"${_AUTO_POWER_PLAN_BAT}\"" \
    bin
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make \
    DESTDIR="$pkgdir" \
    CC="${_CC}" \
    PREFIX="${_PREFIX}" \
    X86_ENERGY_PERF_POLICY=${_X86_ENERGY_PERF_POLICY} \
    INCLUDE_BASH_COMPLETION=${_INCLUDE_BASH_COMPLETION} \
    INCLUDE_ZSH_COMPLETION=${_INCLUDE_ZSH_COMPLETION} \
    INCLUDE_UDEV_RULE=${_INCLUDE_UDEV_RULE} \
    INCLUDE_SYSTEMD_UNIT=${_INCLUDE_SYSTEMD_UNIT} \
    INCLUDE_DOC=${_INCLUDE_DOC} \
    INCLUDE_LICENSE=${_INCLUDE_LICENSE} \
    INCLUDE_SRC=${_INCLUDE_SRC} \
    PRESET_POWER_PLAN_MAX_PERFORMANCE="\"${_PRESET_POWER_PLAN_MAX_PERFORMANCE}\"" \
    PRESET_POWER_PLAN_PERFORMANCE="\"${_PRESET_POWER_PLAN_PERFORMANCE}\"" \
    PRESET_POWER_PLAN_POWERSAVE="\"${_PRESET_POWER_PLAN_POWERSAVE}\"" \
    AUTO_POWER_PLAN_AC="\"${_AUTO_POWER_PLAN_AC}\"" \
    AUTO_POWER_PLAN_BAT="\"${_AUTO_POWER_PLAN_BAT}\"" \
    install
}

