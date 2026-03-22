# Maintainer: Neo Sahadeo neosa+aur@atomicmail.io

pkgname="systemd-nosurv-git"
pkgdesc="Liberated systemd -- no surveillance. Ever."
pkgver=261
pkgrel=1
arch=("x86_64")
license=("GPL-2.0")
source=("git+https://github.com/Jeffrey-Sardina/systemd.git")

sha512sums=("SKIP")
makedepends=('acl' 'apparmor' 'cryptsetup' 'docbook-xsl' 'gperf' 'lz4' 'xz' 'pam' 'libelf'
             'intltool' 'iptables' 'kmod' 'libarchive' 'libcap' 'libidn2' 'libgcrypt'
             'libmicrohttpd' 'libxcrypt' 'libxslt' 'util-linux' 'linux-api-headers'
             'python-jinja' 'python-lxml' 'quota-tools' 'shadow' 'git'
             'meson' 'libseccomp' 'pcre2' 'audit' 'kexec-tools' 'libxkbcommon'
             'bash-completion' 'p11-kit' 'systemd' 'libfido2' 'tpm2-tss' 'rsync'
             'bpf' 'libbpf' 'clang' 'llvm' 'curl' 'gnutls' 'python-pyelftools'
             'libpwquality' 'qrencode' 'lib32-gcc-libs' 'python-pefile' 'linux-headers'
             'ninja'
)

build(){
             echo "Building..."
             cd "${srcdir}/systemd"
             meson setup builddir --prefix=/usr \
                          -Dmode=release \
                          -Db_lto=true
             ninja -C builddir
}

package(){
             echo "Installing..."
             cd "${srcdir}/systemd"
             sudo ninja -C builddir install
}
