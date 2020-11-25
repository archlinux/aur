#Maintainer: kevall474 <kevall474@tuta.io> <https://github.com/kevall474>
#Credits: Jan Alexander Steffens (heftig) <heftig@archlinux.org> ---> For the base PKGBUILD
#Credits: Andreas Radke <andyrtr@archlinux.org> ---> For the base PKGBUILD
#Credits: Linus Torvalds ---> For the linux kernel
#Credits: Joan Figueras <ffigue at gmail dot com> ---> For the base PKFBUILD
#Credits: Piotr Gorski <lucjan.lucjanov@gmail.com> <https://github.com/sirlucjan/kernel-patches> ---> For the patches and the base pkgbuild
#Credits: Tk-Glitch <https://github.com/Tk-Glitch> ---> For some patches

################################# config ################################

#menuconfig ---> value = menuconfig
#nconfig ---> value = nconfig
#xconfig ---> value = xconfig
#gconfig ---> value = gconfig
#makeolddefconfig ---> value = makeolddefconfig
#The default is make olddefconfig

_config=olddefconfig

################################# CPU microarchtectures ################################

#Choose CPU microarchtectures

#Available CPU microarchitectures:
#0) Generic (default)
#1) AMD K6/K6-II/K6-III
#2) AMD Athlon/Duron/K7
#3) AMD Opteron/Athlon64/Hammer/K8
#4) AMD Opteron/Athlon64/Hammer/K8 with SSE3
#5) AMD 61xx/7x50/PhenomX3/X4/II/K10
#6) AMD Family 10h (Barcelona)
#7) AMD Family 14h (Bobcat)
#8) AMD Family 16h (Jaguar)
#9) AMD Family 15h (Bulldozer)
#10) AMD Family 15h (Piledriver)
#11) AMD Family 15h (Steamroller)
#12) AMD Family 15h (Excavator)
#13) AMD Family 17h (Zen)
#14) AMD Family 17h (Zen 2)
#15) Transmeta Crusoe
#16) Transmeta Efficeon
#17) IDT Winchip C6
#18) Winchip-2/Winchip-2A/Winchip-3
#19) AMD Elan
#20) Geode GX1 (Cyrix MediaGX)
#21) AMD Geode GX and LX
#22) Cyrix III or C3
#23) VIA C3 "Nehemiah"
#24) VIA C7
#25) Intel Pentium 4, Pentium D and older Nocona/Dempsey Xeon CPUs with Intel 64bit
#26) Intel Atom
#27) Intel Core 2 and newer Core 2 Xeons (Xeon 51xx and 53xx)
#28) Intel 1st Gen Core i3/i5/i7-family (Nehalem)
#29) Intel 1.5 Gen Core i3/i5/i7-family (Westmere)
#30) Intel Silvermont
#31) Intel Goldmont (Apollo Lake and Denverton)
#32) Intel Goldmont Plus (Gemini Lake)
#33) Intel 2nd Gen Core i3/i5/i7-family (Sandybridge)
#34) Intel 3rd Gen Core i3/i5/i7-family (Ivybridge)
#35) Intel 4th Gen Core i3/i5/i7-family (Haswell)
#36) Intel 5th Gen Core i3/i5/i7-family (Broadwell)
#37) Intel 6th Gen Core i3/i5/i7-family (Skylake)
#38) Intel 6th Gen Core i7/i9-family (Skylake X)
#39) Intel 8th Gen Core i3/i5/i7-family (Cannon Lake)
#40) Intel 8th Gen Core i7/i9-family (Ice Lake)
#41) Xeon processors in the Cascade Lake family
#42) Native optimizations autodetected by GCC

_microarchitecture=0

################################# CONFIG_STACK_VALIDATION ################################

#Enable/disable CONFIG_STACK_VALIDATION

#CONFIG_STACK_VALIDATION gives better stack traces. Also is enabled in all official kernel packages by Archlinux team
#Set value to n to disable
#Set value to y to enable
#default value is set to y

_config_stack_validation=y

################################# IKCONFIG ################################

#Enable/disable IKCONFIG following Arch's philosophy
#Enable access to the kernel configuration file through /proc/config.gz
#Set value to n to disable
#Set value to y to enable
#default value is set to y

_ikconfig=y

################################# NUMA ################################

#Disable/enable NUMA

#Disable NUMA since most users do not have multiple processors. Breaks CUDA/NvEnc.
#Archlinux and Xanmod enable it by default.
#NUMA is optimized for multi-socket motherboards.
#A single multi-core CPU actually runs slower with NUMA enabled.
#Set value to y to disable (possibly increase performance)
#Set value to n to enable
#default value is set to y

_disable_numa=y

################################# FUNCTION_TRACER/GRAPH_TRACER ################################

#Disable/enable FUNCTION_TRACER/GRAPH_TRACER

#For performance you can disable FUNCTION_TRACER/GRAPH_TRACER. Limits debugging and analyzing of the kernel.
#Set value to y to disable (possibly increase performance)
#Set value to n to enable
#default value is set to y

_disable_tracers=y

################################# CONFIG_USER_NS_UNPRIVILEGED ################################

#Enable/disable CONFIG_USER_NS_UNPRIVILEGED

#Disable CONFIG_USER_NS_UNPRIVILEGED
#Set value to y to disable
#Set value to n to enable
#default value is set to y

_disable_ns=y

################################# CPU Governer ################################

#Performance ---> value = performance
#POWERSAVE ---> value = powersave
#USERSPACE ---> value = userspace
#ONDEMAND ---> value = ondemand
#CONSERVATIVE ---> value = conservative
#SCHEDUTIL ---> value = schedutil
#Default value is set to performance

_cpu_gov=performance

################################# CPU HZ ################################

#100
#250
#350
#750
#1000
#Default value is set to 1000

_cpu_hz=1000

################################# I/O Scheduler ################################
########### In this section you need to have at least one enable ###########

#BFQ (Budget Fair Queueing)
#BFQ is a proportional-share I/O scheduler, with some extra
#low-latency capabilities. In addition to cgroups support (blkio or io
#controllers), BFQ's main features are:
#BFQ guarantees a high system and application responsiveness, and a
#low latency for time-sensitive applications, such as audio or video
#players;
#BFQ distributes bandwidth, and not just time, among processes or
#groups (switching back to time distribution when needed to keep
#throughput high).

#Kyber
#The Kyber I/O scheduler is a low-overhead scheduler suitable for
#multiqueue and other fast devices. Given target latencies for reads and
#synchronous writes, it will self-tune queue depths to achieve that
#goal.

#Dealine I/O Scheduler
#The main goal of the Deadline scheduler is to guarantee a start service time for a request.
#It does so by imposing a deadline on all I/O operations to prevent starvation of requests. It
#also maintains two deadline queues, in addition to the sorted queues (both read and write). Deadline
#queues are basically sorted by their deadline (the expiration time), while the sorted queues are sorted
#by the sector number.

#Disable Kyber I/O scheduler
# Set variable disable_kyber n to keep enable (stock kernel)
#                            y to disable
#default value is set to y
_disable_kyber=y

#Disable Deadline I/O scheduler
# Set variable disable_mq_dealine n to keep enable (stock kernel)
#                                 y to disable
#default value is set to y
_disable_mq_deadline=y

#Disable BFQ I/O scheduler
# Set variable disable_bfq n to keep enable (stock kernel)
#                          y to disable
#default value is set to n
_disable_bfq=n

###################################################################################

pkgbase=linux-kernel
pkgname=("$pkgbase" "$pkgbase-headers" "$pkgbase-docs")
pkgver=5.9.11
pkgrel=1
modulestag=${pkgver}-${pkgbase}
pkgdesc="Stable linux kernel, modules, headers and docs"
arch=(x86_64)
url="https://www.kernel.org/"
license=(GPL-2.0)
makedepends=("bison" "flex" "valgrind" "git" "cmake" "make" "extra-cmake-modules" "libelf" "elfutils"
             "python" "python-appdirs" "python-mako" "python-evdev" "python-sphinx_rtd_theme" "python-graphviz" "python-sphinx"
             "clang" "lib32-clang" "bc" "gcc" "gcc-libs" "lib32-gcc-libs" "glibc" "lib32-glibc" "pahole" "patch" "gtk3"
             "kmod" "libmikmod" "lib32-libmikmod" "xmlto" "xmltoman" "graphviz" "imagemagick" "imagemagick-doc" "rsync" "cpio" "inetutils")
patchsource=https://raw.githubusercontent.com/kevall474/kernel-patches/main/${pkgbase}/
source=("https://mirrors.edge.kernel.org/pub/linux/kernel/v5.x/linux-${pkgver}.tar.xz"
        "config"
        "${patchsource}choose-gcc-optimization.sh"
        "${patchsource}0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-CLONE_NEWUSER.patch"
        "${patchsource}sphinx-workaround.patch"
        "${patchsource}0001-LL-kconfig-add-750Hz-timer-interrupt-kernel-config-o.patch"
        "${patchsource}0005-Disable-CPU_FREQ_GOV_SCHEDUTIL.patch"
        "${patchsource}0001-sched-autogroup-Add-kernel-parameter-and-config-opti.patch"
        "${patchsource}0001-ZEN-Add-VHBA-driver.patch"
        "${patchsource}5.9-ll-reverts-ver5.patch"
        "${patchsource}5.9-bfq-dev-lucjan-v13-r2K201022.patch"
        "${patchsource}0001-block-patches.patch"
        "${patchsource}0001-futex-patches.patch"
        "${patchsource}0001-clearlinux-patches.patch"
        "${patchsource}0001-btrfs-patches.patch"
        "${patchsource}0001-ntfs3-patches.patch"
        "${patchsource}0011-ZFS-fix.patch"
        "${patchsource}0001-fs-patches.patch")
md5sums=("530543935698468bf30dfacd4a20d84f"  #linux-5.9.11.tar.xz
         "e1f2fa957d481d0ca9e737bb92528b67"  #config version 5.9.4
         "b3f0a4804b6fe031f674988441c1af35"  #choose-gcc-optimization.sh
         "a724ee14cb7aee1cfa6e4d9770c94723"  #0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-CLONE_NEWUSER.patch
         "2cebdad39da582fd6a0c01746c8adb42"  #sphinx-workaround.patch
         "d15597054a4c5e405f980d07d5eac11a"  #0001-LL-kconfig-add-750Hz-timer-interrupt-kernel-config-o.patch
         "f99b82d6f424d1a729a9b8c5a1be2b84"  #0005-Disable-CPU_FREQ_GOV_SCHEDUTIL.patch
         "34764d6a1af6ab2e06ef6efa95aaa467"  #0001-sched-autogroup-Add-kernel-parameter-and-config-opti.patch
         "a0188e575abe3f27bde9ec09462b067e"  #0001-ZEN-Add-VHBA-driver.patch
         "3ea66f6bbaa249c02aacca01894109ad"  #5.9-ll-reverts-ver5.patch. Apply revert patch to apply bfq-dev-lucjan patches
         "fdf17f2ec486a20ef18b61eecf5cc9cc"  #5.9-bfq-dev-lucjan-v13-r2K201022.patch
         "35db7bfb80ed2867b2e8d5ed92cadb31"  #0001-block-patches.patch
         "c97b042c437883db1e768ff474e8b35c"  #0001-futex-patches.patch
         "eb812a74ec92add2108b48f5a9f048fc"  #0001-clearlinux-patches.patch
         "ad0dd4477201efb9fa86b33231ce62d8"  #0001-btrfs-patches.patch
         "50d1cb09cf619482ceb6b5d868681448"  #0001-ntfs3-patches.patch
         "c19fd76423bfc4af45d99585cedb2623"  #0011-ZFS-fix.patch
         "656de58729054bb71c9dc5dee737e589") #0001-fs-patches.patch

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=${pkgbase}
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare(){
  cd linux-${pkgver}

  # Apply any patch
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    msg2 "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  # Copy the config file first
  # Copy "${srcdir}"/config to linux-${pkgver}/.config
  msg2 "Copy "${srcdir}"/config to linux-${pkgver}/.config"
  cp "${srcdir}"/config .config

  # CONFIG_STACK_VALIDATION gives better stack traces. Also is enabled in all official kernel packages by Archlinux team
  if [[ $_config_stack_validation = "y" ]]; then
    msg2 "Enable CONFIG_STACK_VALIDATION gives better stack traces... Also is enabled in all official kernel packages by Archlinux team"
    scripts/config --enable CONFIG_STACK_VALIDATION
  elif [[ $_config_stack_validation = "n" ]]; then
     msg2 "Disable CONFIG_STACK_VALIDATION"
     scripts/config --disable CONFIG_STACK_VALIDATION
  fi

  # Enable IKCONFIG following Arch's philosophy
  # Enable access to the kernel configuration file through /proc/config.gz
  if [[ $_ikconfig = "y" ]]; then
    msg2 "Enable CONFIG_IKCONFIG/CONFIG_IKCONFIG_PROC following Arch's philosophy... Enable access to the kernel configuration file through /proc/config.gz"
    scripts/config --enable CONFIG_IKCONFIG
    scripts/config --enable CONFIG_IKCONFIG_PROC
  elif [[ $_ikconfig = "n" ]]; then
     msg2 "Disable CONFIG_STACK_VALIDATION..."
    scripts/config --disable CONFIG_IKCONFIG
    scripts/config --disable CONFIG_IKCONFIG_PROC
  fi

  # Enable/Disable NUMA
  if [[ $_disable_numa = "y" ]]; then
    msg2 "Disable NUMA since most users do not have multiple processors... Breaks CUDA/NvEnc..."
    scripts/config --disable CONFIG_NUMA
  elif [[ $_disable_numa = "n" ]]; then
    msg2 "Enable NUMA..."
    scripts/config --enable CONFIG_NUMA
  fi

  # Disable/enable FUNCTION_TRACER/GRAPH_TRACER
  if [[ "$_disable_tracers" = "y" ]]; then
    msg2 "Disabling FUNCTION_TRACER/GRAPH_TRACER... Limits debugging and analyzing of the kernel"
    scripts/config --disable CONFIG_FUNCTION_TRACER
    scripts/config --disable CONFIG_STACK_TRACER
  elif [[ "$_disable_tracers" = "n" ]]; then
    msg2 "Enable FUNCTION_TRACER/GRAPH_TRACER..."
    scripts/config --enable CONFIG_FUNCTION_TRACER
    scripts/config --enable CONFIG_STACK_TRACER
  fi

  # Enable/Disable CONFIG_USER_NS_UNPRIVILEGED
  if [[ "$_disable_ns" = "y" ]]; then
    msg2 "Disabling CONFIG_USER_NS_UNPRIVILEGED..."
    scripts/config --disable CONFIG_USER_NS_UNPRIVILEGED
  elif [[ "$_disable_ns" = "n" ]]; then
    msg2 "Enable CONFIG_USER_NS_UNPRIVILEGED..."
    scripts/config --enable CONFIG_USER_NS_UNPRIVILEGED
  fi

  # Set CPU Governor
  msg2 "Set CPU Governor"
  if [[ $_cpu_gov = "performance" ]]; then
    msg2 "Enable CPU_FREQ_DEFAULT_GOV_PERFORMANCE and CONFIG_CPU_FREQ_GOV_PERFORMANCE..."
    scripts/config --enable CONFIG_CPU_FREQ
    scripts/config --enable CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE
    scripts/config --enable CONFIG_CPU_FREQ_GOV_PERFORMANCE
    scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE
    scripts/config --disable CONFIG_CPU_FREQ_GOV_POWERSAVE
    scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE
    scripts/config --disable CONFIG_CPU_FREQ_GOV_USERSPACE
    scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND
    scripts/config --disable CONFIG_CPU_FREQ_GOV_ONDEMAND
    scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE
    scripts/config --disable CONFIG_CPU_FREQ_GOV_CONSERVATIVE
    scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL
    scripts/config --disable CONFIG_CPU_FREQ_GOV_SCHEDUTIL
  elif [[ $_cpu_gov = "powersave" ]]; then
    msg2 "Enable CPU_FREQ_DEFAULT_GOV_POWERSAVE and CONFIG_CPU_FREQ_GOV_POWERSAVE..."
    scripts/config --enable CONFIG_CPU_FREQ
    scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE
    scripts/config --disable CONFIG_CPU_FREQ_GOV_PERFORMANCE
    scripts/config --enable CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE
    scripts/config --enable CONFIG_CPU_FREQ_GOV_POWERSAVE
    scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE
    scripts/config --disable CONFIG_CPU_FREQ_GOV_USERSPACE
    scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND
    scripts/config --disable CONFIG_CPU_FREQ_GOV_ONDEMAND
    scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE
    scripts/config --disable CONFIG_CPU_FREQ_GOV_CONSERVATIVE
    scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL
    scripts/config --disable CONFIG_CPU_FREQ_GOV_SCHEDUTIL
  elif [[ $_cpu_gov = "userspace" ]]; then
    msg2 "Enable CPU_FREQ_DEFAULT_GOV_USERSPACE and CONFIG_CPU_FREQ_GOV_USERSPACE..."
    scripts/config --enable CONFIG_CPU_FREQ
    scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE
    scripts/config --disable CONFIG_CPU_FREQ_GOV_PERFORMANCE
    scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE
    scripts/config --disable CONFIG_CPU_FREQ_GOV_POWERSAVE
    scripts/config --enable CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE
    scripts/config --enable CONFIG_CPU_FREQ_GOV_USERSPACE
    scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND
    scripts/config --disable CONFIG_CPU_FREQ_GOV_ONDEMAND
    scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE
    scripts/config --disable CONFIG_CPU_FREQ_GOV_CONSERVATIVE
    scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL
    scripts/config --disable CONFIG_CPU_FREQ_GOV_SCHEDUTIL
  elif [[ $_cpu_gov = "ondemand" ]]; then
    msg2 "Enable CPU_FREQ_DEFAULT_GOV_ONDEMAND and CONFIG_CPU_FREQ_GOV_ONDEMAND..."
    scripts/config --enable CONFIG_CPU_FREQ
    scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE
    scripts/config --disable CONFIG_CPU_FREQ_GOV_PERFORMANCE
    scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE
    scripts/config --disable CONFIG_CPU_FREQ_GOV_POWERSAVE
    scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE
    scripts/config --disable CONFIG_CPU_FREQ_GOV_USERSPACE
    scripts/config --enable CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND
    scripts/config --enable CONFIG_CPU_FREQ_GOV_ONDEMAND
    scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE
    scripts/config --disable CONFIG_CPU_FREQ_GOV_CONSERVATIVE
    scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL
    scripts/config --disable CONFIG_CPU_FREQ_GOV_SCHEDUTIL
  elif [[ $_cpu_gov = "conservative" ]]; then
    msg2 "Enable CPU_FREQ_DEFAULT_GOV_CONSERVATIVE and CONFIG_CPU_FREQ_GOV_CONSERVATIVE..."
    scripts/config --enable CONFIG_CPU_FREQ
    scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE
    scripts/config --disable CONFIG_CPU_FREQ_GOV_PERFORMANCE
    scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE
    scripts/config --disable CONFIG_CPU_FREQ_GOV_POWERSAVE
    scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE
    scripts/config --disable CONFIG_CPU_FREQ_GOV_USERSPACE
    scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND
    scripts/config --disable CONFIG_CPU_FREQ_GOV_ONDEMAND
    scripts/config --enable CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE
    scripts/config --enable CONFIG_CPU_FREQ_GOV_CONSERVATIVE
    scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL
    scripts/config --disable CONFIG_CPU_FREQ_GOV_SCHEDUTIL
  elif [[ $_cpu_gov = "schedutil" ]]; then
    msg2 "Enable CPU_FREQ_DEFAULT_GOV_SCHEDUTIL and CONFIG_CPU_FREQ_GOV_SCHEDUTIL..."
    scripts/config --enable CONFIG_CPU_FREQ
    scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE
    scripts/config --disable CONFIG_CPU_FREQ_GOV_PERFORMANCE
    scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE
    scripts/config --disable CONFIG_CPU_FREQ_GOV_POWERSAVE
    scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE
    scripts/config --disable CONFIG_CPU_FREQ_GOV_USERSPACE
    scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND
    scripts/config --disable CONFIG_CPU_FREQ_GOV_ONDEMAND
    scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE
    scripts/config --disable CONFIG_CPU_FREQ_GOV_CONSERVATIVE
    scripts/config --enable CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL
    scripts/config --enable CONFIG_CPU_FREQ_GOV_SCHEDUTIL
  fi

  # Set CONFIG_HZ
  msg2 "Set CONFIG_HZ"
  if [[ $_cpu_hz = "100" ]]; then
    msg2 "Enable CONFIG_HZ_100..."
    scripts/config --enable CONFIG_HZ_100
    scripts/config --set-val CONFIG_HZ 100
    scripts/config --disable CONFIG_HZ_250
    scripts/config --disable CONFIG_HZ_300
    scripts/config --disable CONFIG_HZ_750
    scripts/config --disable CONFIG_HZ_1000
  elif [[ $_cpu_hz = "250" ]]; then
    msg2 "Enable CONFIG_HZ_250..."
    scripts/config --enable CONFIG_HZ_250
    scripts/config --set-val CONFIG_HZ 250
    scripts/config --disable CONFIG_HZ_300
    scripts/config --disable CONFIG_HZ_750
    scripts/config --disable CONFIG_HZ_100
    scripts/config --disable CONFIG_HZ_1000
  elif [[ $_cpu_hz = "300" ]]; then
    msg2 "Enable CONFIG_HZ_300..."
    scripts/config --enable CONFIG_HZ_300
    scripts/config --set-val CONFIG_HZ 300
    scripts/config --disable CONFIG_HZ_250
    scripts/config --disable CONFIG_HZ_750
    scripts/config --disable CONFIG_HZ_100
    scripts/config --disable CONFIG_HZ_1000
  elif [[ $_cpu_hz = "750" ]]; then
    msg2 "Enable CONFIG_HZ_750..."
    scripts/config --enable CONFIG_HZ_750
    scripts/config --set-val CONFIG_HZ 750
    scripts/config --disable CONFIG_HZ_300
    scripts/config --disable CONFIG_HZ_100
    scripts/config --disable CONFIG_HZ_250
    scripts/config --disable CONFIG_HZ_1000
  elif [[ $_cpu_hz = "1000" ]]; then
    msg2 "Enable CONFIG_HZ_1000..."
    scripts/config --enable CONFIG_HZ_1000
    scripts/config --set-val CONFIG_HZ 1000
    scripts/config --disable CONFIG_HZ_300
    scripts/config --disable CONFIG_HZ_750
    scripts/config --disable CONFIG_HZ_250
    scripts/config --disable CONFIG_HZ_100
  fi

  # Enable/disable Kyber I/O scheduler
  if [[ "$_disable_kyber" = "y" ]]; then
    msg2 "Disabling Kyber I/O scheduler..."
    scripts/config --disable CONFIG_MQ_IOSCHED_KYBER
  elif [[ "$_disable_kyber" = "n" ]]; then
    msg2 "Enable Kyber I/O scheduler..."
    scripts/config --enable CONFIG_MQ_IOSCHED_KYBER
  fi

  # Enable/disable MQ-Deadline I/O scheduler
  if [[ "$_disable_mq_deadline" = "y" ]]; then
    msg2 "Disabling Deadline I/O scheduler..."
    scripts/config --disable CONFIG_MQ_IOSCHED_DEADLINE
    scripts/config --disable CONFIG_MQ_IOSCHED_DEADLINE_NODEFAULT
  elif [[ "$_disable_mq_deadline" = "n" ]]; then
    msg2 "Enable Deadline I/O scheduler..."
    scripts/config --enable CONFIG_MQ_IOSCHED_DEADLINE
    scripts/config --enable CONFIG_MQ_IOSCHED_DEADLINE_NODEFAULT
  fi

  # Enable/disable BFQ I/O scheduler
  if [[ "$_disable_bfq" = "y" ]]; then
    msg2 "Disabling BFQ I/O scheduler..."
    scripts/config --disable CONFIG_IOSCHED_BFQ
    scripts/config --disable CONFIG_BFQ_GROUP_IOSCHED
    scripts/config --disable CONFIG_BFQ_CGROUP_DEBUG
  elif [[ "$_disable_bfq" = "n" ]]; then
    msg2 "Enable BFQ I/O scheduler..."
    scripts/config --enable CONFIG_IOSCHED_BFQ
    scripts/config --enable CONFIG_BFQ_GROUP_IOSCHED
    scripts/config --enable CONFIG_BFQ_CGROUP_DEBUG
  fi

  # Let's user choose microarchitecture optimization in GCC
  sh ${srcdir}/choose-gcc-optimization.sh $_microarchitecture

  # Setting localversion
  msg2 "Setting localversion..."
  scripts/setlocalversion --save-scmversion
  echo "-${pkgbase}" > localversion

  # Config
  if [[ "$_config" = "nconfig" ]]; then
    msg2 "make nconfig..."
    make nconfig
  elif [[ "$_config" = "menuconfig" ]]; then
    msg2 "make menuconfig..."
    make menuconfig
  elif [[ "$_config" = "xconfig" ]]; then
    msg2 "make xconfig..."
    make xconfig
  elif [[ "$_config" = "gconfig" ]]; then
    msg2 "make gconfig..."
    make gconfig
  elif [[ "$_config" = "olddefconfig" ]]; then
    msg2 "make olddefconfig..."
    make olddefconfig
  fi
}

build(){
  cd linux-${pkgver}

  # make -j$(nproc) all
  msg2 "make -j$(nproc) all..."
  make -j$(nproc) all
}

package_linux-kernel(){
  pkgdesc="Stable linux kernel and modules with a set of patches by TK-Glitch and Piotr Górski"
  depends=("coreutils" "kmod" "initramfs" "mkinitcpio")
  optdepends=("linux-firmware: firmware images needed for some devices"
              "crda: to set the correct wireless channels of your country")
  provides=("VIRTUALBOX-GUEST-MODULES" "WIREGUARD-MODULE")

  # Create system tree
  msg2 "Create system tree..."
  install -dm755 "${pkgdir}"/usr
  install -dm755 "${pkgdir}"/boot

  cd linux-${pkgver}

  # Installing modules
  msg2 "Installing modules..."
  make INSTALL_MOD_PATH="${pkgdir}"/usr INSTALL_MOD_STRIP=1 -j$(nproc) modules_install

  # Copy bzImage to "${pkgdir}"/boot/vmlinuz-${pkgbase}
  msg2 "Copy bzImage to "${pkgdir}"/boot/vmlinuz-${pkgbase}"
  cp arch/x86/boot/bzImage "${pkgdir}"/boot/vmlinuz-${pkgbase}

  # Copy bzImage to "${pkgdir}"/usr/lib/modules/${modulestag}/vmlinuz
  msg2 "Copy bzImage to "${pkgdir}"/usr/lib/modules/${modulestag}/vmlinuz"
  cp arch/x86/boot/bzImage "${pkgdir}"/usr/lib/modules/${modulestag}/vmlinuz
  
  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modules/${modulestag}/pkgbase"

  # Remove build dir and source dir
  msg2 "Remove build dir and source dir..."
  rm -rf "${pkgdir}"/usr/lib/modules/${modulestag}/build
  rm -rf "${pkgdir}"/usr/lib/modules/${modulestag}/source
}

package_linux-kernel-headers(){
  pkgdesc="Headers and scripts for building modules for the ${pkgbase} package"
  depends=("${pkgbase}")

  # Create system tree
  msg2 "Create system tree..."
  install -dm755 "${pkgdir}"/usr/lib/modules/${modulestag}/build

  cd linux-${pkgver}

  local builddir="$pkgdir/usr/lib/modules/${modulestag}/build"

  msg2 "Installing build files..."
  install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map vmlinux localversion
  install -Dt "$builddir/kernel" -m644 kernel/Makefile
  install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile
  cp -t "$builddir" -a scripts

  # add objtool for external module building and enabled VALIDATION_STACK option
  install -Dt "$builddir/tools/objtool" tools/objtool/objtool

  # add xfs and shmem for aufs building
  mkdir -p "$builddir"/{fs/xfs,mm}

  msg2 "Installing headers..."
  cp -t "$builddir" -a include
  cp -t "$builddir/arch/x86" -a arch/x86/include
  install -Dt "$builddir/arch/x86/kernel" -m644 arch/x86/kernel/asm-offsets.s

  install -Dt "$builddir/drivers/md" -m644 drivers/md/*.h
  install -Dt "$builddir/net/mac80211" -m644 net/mac80211/*.h

  # http://bugs.archlinux.org/task/13146
  install -Dt "$builddir/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h

  # http://bugs.archlinux.org/task/20402
  install -Dt "$builddir/drivers/media/usb/dvb-usb" -m644 drivers/media/usb/dvb-usb/*.h
  install -Dt "$builddir/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/*.h
  install -Dt "$builddir/drivers/media/tuners" -m644 drivers/media/tuners/*.h

  msg2 "Installing KConfig files..."
  find . -name 'Kconfig*' -exec install -Dm644 {} "$builddir/{}" \;

  msg2 "Removing unneeded architectures..."
  local arch
  for arch in "$builddir"/arch/*/; do
    [[ $arch = */x86/ ]] && continue
    msg2 "Removing $(basename "$arch")"
    rm -r "$arch"
  done

  msg2 "Removing documentation..."
  rm -r "$builddir/Documentation"

  msg2 "Removing broken symlinks..."
  find -L "$builddir" -type l -printf 'Removing %P\n' -delete

  msg2 "Removing loose objects..."
  find "$builddir" -type f -name '*.o' -printf 'Removing %P\n' -delete

  msg2 "Stripping build tools..."
  local file
  while read -rd '' file; do
    case "$(file -bi "$file")" in
      application/x-sharedlib\;*)      # Libraries (.so)
        strip -v $STRIP_SHARED "$file" ;;
      application/x-archive\;*)        # Libraries (.a)
        strip -v $STRIP_STATIC "$file" ;;
      application/x-executable\;*)     # Binaries
        strip -v $STRIP_BINARIES "$file" ;;
      application/x-pie-executable\;*) # Relocatable binaries
        strip -v $STRIP_SHARED "$file" ;;
    esac
  done < <(find "$builddir" -type f -perm -u+x ! -name vmlinux -print0)

  msg2 "Stripping vmlinux..."
  strip -v $STRIP_STATIC "$builddir/vmlinux"

  msg2 "Adding symlink..."
  mkdir -p "$pkgdir/usr/src"
  ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase"
}

package_linux-kernel-docs() {
  pkgdesc="Documentation for the ${pkgbase} package"
  depends=("${pkgbase}")

  # Create system tree
  msg2 "Create system tree..."

  install -dm755 "${pkgdir}"/usr/lib/modules/${modulestag}/build

  cd linux-${pkgver}

  # make -j$(nproc) htmldocs
  msg2 "make -j$(nproc) htmldocs..."
  make -j$(nproc) htmldocs

  local builddir="$pkgdir/usr/lib/modules/${modulestag}/build"

  msg2 "Installing documentation..."
  local src dst
  while read -rd '' src; do
    dst="${src#Documentation/}"
    dst="$builddir/Documentation/${dst#output/}"
    install -Dm644 "$src" "$dst"
  done < <(find Documentation -name '.*' -prune -o ! -type d -print0)

  msg2 "Adding symlink..."
  mkdir -p "$pkgdir/usr/share/doc"
  ln -sr "$builddir/Documentation" "$pkgdir/usr/share/doc/$pkgbase"
}
