# Maintainer Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=boost-libs-171-opt
pkgver=1.71.0
pkgrel=1
pkgdesc='Free peer-reviewed portable C++ runtime libraries (installs to /opt, without numpy & python support)'
url='https://www.boost.org'
arch=('x86_64')
license=('custom')
depends=('bzip2' 'zlib' 'icu' 'zstd')
optdepends=('openmpi: for mpi support')
provides=(libboost_atomic.so=1.71.0
          libboost_chrono.so=1.71.0
          libboost_container.so=1.71.0
          libboost_context.so=1.71.0
          libboost_contract.so=1.71.0
          libboost_coroutine.so=1.71.0
          libboost_date_time.so=1.71.0
          libboost_fiber.so=1.71.0
          libboost_filesystem.so=1.71.0
          libboost_graph.so=1.71.0
          libboost_iostreams.so=1.71.0
          libboost_locale.so=1.71.0
          libboost_wserialization.so=1.71.0
          libboost_log.so=1.71.0
          libboost_wave.so=1.71.0
          libboost_math_c99.so=1.71.0
          libboost_math_c99f.so=1.71.0
          libboost_math_c99l.so=1.71.0
          libboost_math_tr1.so=1.71.0
          libboost_math_tr1f.so=1.71.0
          libboost_math_tr1l.so=1.71.0
          libboost_prg_exec_monitor.so=1.71.0
          libboost_program_options.so=1.71.0
          libboost_random.so=1.71.0
          libboost_regex.so=1.71.0
          libboost_serialization.so=1.71.0
          libboost_stacktrace_addr2line.so=1.71.0
          libboost_stacktrace_basic.so=1.71.0
          libboost_stacktrace_noop.so=1.71.0
          libboost_system.so=1.71.0
          libboost_thread.so=1.71.0
          libboost_timer.so=1.71.0
          libboost_type_erasure.so=1.71.0
          libboost_unit_test_framework.so=1.71.0
          ibboost_log_setup.so=1.71.0
          'boost-libs')
makedepends=('icu'
             'bzip2'
             'zlib'
             'openmpi'
             'zstd'
             'findutils')
source=("${pkgname}-${pkgver}.tar.gz::https://dl.bintray.com/boostorg/release/${pkgver}/source/boost_1_71_0.tar.gz")
sha256sums=('96b34f7468f26a141f6020efb813f1a2f3dfb9797ecf76a7d7cbd843cc95f5bd')

prepare() {
  cd "boost_1_71_0"
  ./bootstrap.sh
}

build() {
  cd "boost_1_71_0"
  ./b2
}

package() {
  cd "boost_1_71_0"
  install -d "${pkgdir}/opt/usr/include/"
  install -d "${pkgdir}/opt/usr/lib/"
  cp -r boost "${pkgdir}/opt/usr/include/"
  cp -r stage/lib/* "${pkgdir}/opt/usr/lib/"
  install -Dm644 LICENSE_1_0.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim: ts=2 sw=2 et: