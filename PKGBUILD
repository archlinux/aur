# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-crds
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=13.0.6
pkgrel=1
pkgdesc="Calibration Reference Data System for HST and JWST"
arch=('any')
url="https://hst-crds.stsci.edu/static/users_guide/index.html"
license=('BSD-3-Clause')
makedepends=('python-setuptools-scm' 'python-build' 'python-installer')
#checkdepends=('python-pytest-xdist'
#              'python-mock'
#              'python-astropy'
#              'python-yaml'
#              'python-beautifulsoup4'
#              'python-asdf'
#              'python-parsley'
#              'python-jwst'
#              )
##             'python-lockfile'
##             'python-filelock'
##             'python-nose'
##             'python-pylint'
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
#       'fix-roman-asdf-test.patch')
md5sums=('a6ae96804e7587ce0198a853552e50f1')

#get_pyinfo() {
#    [[ $1 == "site" ]] && python -c "import site; print(site.getsitepackages()[0])" || \
#        python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
#}

#prepare() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    patch -Np1 -i "${srcdir}/fix-roman-asdf-test.patch"
#}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python -m build --wheel --no-isolation
}

#check() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
##   mkdir -p crdscache
##   CRDS_TESTING_CACHE="crdscache" pytest -vv -l -ra --color=yes -o console_output_style=count #\
##   test/submit/test_submit.py .
##   metrisc_logger, stdatamodels
##   mkdir -p .crds/mappings/hst
#    python -m installer --destdir=tmp_install dist/*.whl
#    PATH="tmp_install/usr/bin:${PATH}" PYTHONPATH="tmp_install/$(get_pyinfo site)" \
#        CRDS_PATH=.crds CRDS_SERVER_URL=https://hst-crds.stsci.edu CRDS_CONTEXT=hst_1186.pmap pytest -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 5 \
#        --ignore=test/bestrefs/test_bestrefs.py \
#        --ignore=test/certify/test_certify.py \
#        --ignore=test/roman/test_roman.py \
#        --ignore=test/test_build6.py \
#        --ignore=test/test_list.py \
#        --ignore=test/test_sync.py \
#        --ignore=test/bestrefs/test_special.py \
#        --deselect=test/core/test_heavy_client.py \
#        --ignore=test/bestrefs/test_table_effects.py \
#        --deselect=test/test_bad_files.py::test_bad_references_bestrefs_script_error \
#        --deselect=test/test_bad_files.py::test_bad_references_bestrefs_script_warning \
#        --deselect=test/test_bad_files.py::test_bad_references_error_cache_config \
#        --deselect=test/test_diff.py::test_diff_print_all_new_files \
#        --deselect=test/test_sync.py::TestSync::test_sync_contexts \
#        --deselect=test/test_sync.py::TestSync::test_sync_explicit_files \
#        --deselect=test/certify/test_certify.py::test_certify_duplicate_sha1sum \
#        --deselect=test/certify/test_certify.py::test_certify_dont_recurse_mappings \
#        --deselect=test/core/test_cmdline.py::test_require_server_connnection \
#        --deselect=test/core/test_cmdline.py::test_resolve_context \
#        --deselect=test/core/test_cmdline.py::test_dump_files \
#        --deselect=test/core/test_cmdline.py::test_sync_files \
#        --deselect=test/core/test_cmdline.py::test_file_outside_cache_mapping_spec \
#        --deselect=test/core/test_cmdline.py::test_dump_mappings \
#        --deselect=test/core/test_cmdline.py::test_determine_contexts_all \
#        --deselect=test/core/test_cmdline.py::test_determine_contexts_last_n \
#        --deselect=test/core/test_cmdline.py::test_determine_contexts_range \
#        --deselect=test/core/test_cmdline.py::test_determine_contexts_upto \
#        --deselect=test/core/test_cmdline.py::test_determine_contexts_after \
#        --deselect=test/core/test_cmdline.py::test_determine_contexts_direct \
#        --deselect=test/submit/test_submit.py::TestSubmit::test_goodvalue_char \
#        --deselect=test/submit/test_submit.py::TestSubmit::test_badkey \
#        --deselect=test/submit/test_submit.py::TestSubmit::test_multiple_invalid_chars \
#        --deselect=test/submit/test_submit.py::TestSubmit::test_addfiles \
#        --deselect=test/submit/test_submit.py::TestSubmit::test_badvalue_trinary \
#        --deselect=test/submit/test_submit.py::TestSubmit::test_badvalue_choices \
#        --deselect=test/submit/test_submit.py::TestSubmit::test_invalid_description \
#        --deselect=test/submit/test_submit.py::TestSubmit::test_resetfield \
#        --deselect=test/submit/test_submit.py::TestSubmit::test_validate \
#        --deselect=test/submit/test_submit.py::TestSubmit::test_rmfile \
#        --deselect=test/submit/test_submit.py::TestSubmit::test_addbadfile \
#        --deselect=test/certify/test_certify.py::test_asdf_library_version_fail \
#        --deselect=test/misc/test_synphot.py::test_synphot_certify_rmaps_thruput \
#        --deselect=test/submit/test_submit.py::TestSubmit::test_emptyvalue_char \
#        --deselect=test/submit/test_submit.py::TestSubmit::test_emptyvalue_optional #|| warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count
#
##       --deselect=test/test_list.py::test_list_hst_mappings \
##       --deselect=test/test_list.py::test_list_jwst_mappings \
##       --deselect=test/test_list.py::test_list_cached_mappings \
##       --deselect=test/test_list.py::test_list_cached_references_hst \
##       --deselect=test/test_list.py::test_list_cached_references_jwst \
##       --deselect=test/test_list.py::test_list_dataset_ids \
##       --deselect=test/test_list.py::test_list_dataset_headers \
##       --deselect=test/test_list.py::test_list_resolve_contexts_range \
##       --deselect=test/test_list.py::test_list_resolve_contexts_date \
##       --deselect=test/test_list.py::test_list_remote_context \
##       --deselect=test/test_list.py::test_list_operational_context \
##       --deselect=test/test_list.py::test_list_references_by_context
##       --deselect=test/test_build6.py::test_get_context_history \
##       --deselect=test/test_build6.py::test_query_affected_datasets_list \
##       --deselect=test/bestrefs/test_special.py::test_bestrefs_na_undefined_single_ctx_defaults \
##       --deselect=test/bestrefs/test_special.py::test_bestrefs_na_undefined_single_ctx_undefined_matters
##       --deselect=test/core/test_heavy_client.py::test_getreferences_rmap_na
##       --ignore=test/roman/asdf/pytest_test_asdf_structure.py #|| warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count
#}

package_python-crds() {
    depends=('python-filelock' 'python-astropy' 'python-asdf>3.0.0' 'python-requests' 'python-parsley')
    optdepends=('python-crds-doc: Documentation for CRDS')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.rst
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
